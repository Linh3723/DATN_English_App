import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthRepository({FirebaseAuth? firebaseAuth, FirebaseFirestore? firestore})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
      _firestore = firestore ?? FirebaseFirestore.instance;

  Stream<UserModel?> get authStateChanges {
    return _firebaseAuth.authStateChanges().asyncMap((user) async {
      if (user == null) return null;

      // Get user data from Firestore
      final doc = await _firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        return UserModel.fromFirestore(doc);
      }
      return null;
    });
  }

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.updateDisplayName(fullName);

      final user = UserModel(
        uid: userCredential.user!.uid,
        email: email,
        fullName: fullName,
        createdAt: DateTime.now(),
        lastLoginAt: DateTime.now(),
        role: role,
      );

      // Save user data to firestore
      await _firestore.collection('users').doc(user.uid).set(user.toFirestore());

      return user;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }
  
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async{
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // get user data from Firestore
      final doc = await _firestore.collection('users').doc(userCredential.user!.uid).get();
      if(!doc.exists){
        throw Exception('User data not found');
      }

      final user = UserModel.fromFirestore(doc);

      // update last login time
      await _firestore.collection('users').doc(user.uid).update({'lastLoginAt' : Timestamp.now()});

      return user;

    } on FirebaseAuthException catch (e){
      throw _handleAuthException(e);
    }
  }

  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }

  Future<void> resetPassword(String email) async{
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e){
      throw _handleAuthException(e);
    }
  }

  Future<void> updateProfile({
    String? fullName,
    String? photoUrl,
  }) async{
    try {
      final user = _firebaseAuth.currentUser;
      if(user == null) throw Exception('User not found');

      if(fullName != null){
        await user.updateDisplayName(fullName);
      }
      if(photoUrl != null){
        await user.updatePhotoURL(photoUrl);
      }
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  String _handleAuthException(FirebaseAuthException e){
    switch(e.code){
      case 'weak-password' :
        return 'Mật khẩu cần có ít nhất 6 ký tự';
      case 'email-already-in-use':
        return 'Email này đã được sử dụng cho tài khoản khác';
      case 'user-not-found':
        return 'Không tìm thấy tài khoản nào sử dụng email này';
      case 'wrong-password':
        return 'Sai mật khẩu';
      case 'invalid-email':
        return 'Email không hợp lệ';
      case 'user-disabled':
        return 'Tài khoản này đã bị vô hiệu hóa';
      case 'operation-not-allowed':
        return 'Email và mật khẩu chưa được kích hoạt';
      case 'too-many-request':
        return 'Quá nhiều lần thử, vui lòng thử lại sau';
      case 'network-request-failed':
        return 'Lỗi kết nối mạng, vui lòng kiểm tra lại';
      case 'invalid-credential':
        return 'Thông tin đăng nhập không hợp lệ';
      case 'account-exists-with-diferent-credential':
        return 'Tài khoản đang được đăng nhập trên một thiết bị khác';
      default:
        return e.message ?? 'An unexpected error occurred';
    }
  }
}
