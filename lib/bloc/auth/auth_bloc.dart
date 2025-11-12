import 'package:bloc/bloc.dart';
import 'package:english_app/bloc/auth/auth_event.dart';
import 'package:english_app/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  AuthBloc() : super(const AuthState()){
    on<AuthStateChanged>(_onAuthStateChanged);
    on<RegisterRequested>(_onRegisterRequested);
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<UpdateProfileRequested>(_onUpdateProfileRequested);
    on<ForgotPasswordRequested>(_onForgotPasswordRequested);
  }

  Future<void> _onAuthStateChanged(
        AuthStateChanged event,
        Emitter<AuthState> emit,
      )async{
    // TODO: Implement authentication state changes
    emit(const AuthState());
  }

  Future<void> _onRegisterRequested(
      RegisterRequested event,
      Emitter<AuthState> emit,
      )async{
        try{
          emit(state.copyWith(isLoading: true));
          // TODO: Implement registration logic
          emit(state.copyWith(isLoading: false));

        }catch(e){
          emit(state.copyWith(error: e.toString(), isLoading: false));
        }
  }

  Future<void> _onLoginRequested(
      LoginRequested event,
      Emitter<AuthState> emit,
      )async{
    try{
      emit(state.copyWith(isLoading: true));
      // TODO: Implement login logic
      emit(state.copyWith(isLoading: false));

    }catch(e){
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> _onLogoutRequested(
      LogoutRequested event,
      Emitter<AuthState> emit,
      )async{
    try{
      // TODO: Implement logout logic
      emit(const AuthState());

    }catch(e){
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onUpdateProfileRequested(
      UpdateProfileRequested event,
      Emitter<AuthState> emit,
      )async{
    try{
      emit(state.copyWith(isLoading: true));
      // TODO: Implement profile update logic
      emit(state.copyWith(isLoading: false));

    }catch(e){
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> _onForgotPasswordRequested(
      ForgotPasswordRequested event,
      Emitter<AuthState> emit,
      )async{
    try{
      emit(state.copyWith(isLoading: true));
      // TODO: Implement forgot password logic
      emit(state.copyWith(isLoading: false));

    }catch(e){
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }
}