import 'dart:isolate';
import 'dart:typed_data';

import 'package:english_app/models/course.dart';
import 'package:english_app/models/lesson.dart';
import 'package:english_app/models/question.dart';
import 'package:english_app/models/quiz.dart';
import 'package:english_app/models/quiz_attempt.dart';
import 'package:english_app/models/chat_message.dart';

class DummyDataService {
  static final List<Course> courses = [
    Course(
      id: '1',
      title: 'Kỹ năng Nghe',
      description: 'Khóa học giúp người học làm quen với nhiều giọng tiếng Anh khác nhau (Anh – Mỹ – Úc), luyện kỹ năng nghe cơ bản thông qua hội thoại, podcast và video thực tế.',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/5295/5295318.png',
      instructorId: 'inst_1',
      categoryId: '1',
      price: 100000,
      lessons: _createListeningLessons(),
      level: 'Cơ bản',
      requirements: [
        'Biết các cấu trúc tiếng Anh cơ bản',
        'Có khả năng nhận diện từ vựng phổ thông',
      ],
      whatYouWillLearn: [
        'Cách nghe hiểu nhanh thông tin chính',
        'Luyện khả năng “bắt từ khóa” khi nghe',
        'Làm quen tốc độ nói tự nhiên của người bản xứ',
        'Kỹ thuật nghe theo chủ đề và theo ngữ cảnh',
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      updatedAt: DateTime.now(),
      rating: 4.5,
      reviewCount: 123,
      enrollmentCount: 1000,
    ),
    Course(
      id: '2',
      title: 'Kỹ năng Nói',
      description: 'Khóa học tập trung giúp học viên luyện phát âm, cải thiện ngữ điệu, tăng phản xạ và giao tiếp tự nhiên trong nhiều tình huống đời sống và công việc.',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1683/1683145.png',
      instructorId: 'inst_2',
      categoryId: '2',
      price: 100000,
      lessons: _createSpeakingLessons(),
      level: 'Cơ bản',
      requirements: [
        'Nắm vững ngữ pháp cơ bản',
        'Có vốn từ vựng ở trình độ sơ cấp',
      ],
      whatYouWillLearn: [
        'Phát âm chuẩn theo bảng IPA',
        'Tăng phản xạ nói qua luyện hội thoại theo ngữ cảnh',
        'Nói trôi chảy và tự nhiên hơn',
        'Giao tiếp tự tin trong phỏng vấn, thuyết trình, nói chuyện hằng ngày',
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      updatedAt: DateTime.now(),
      rating: 4.5,
      reviewCount: 234,
      enrollmentCount: 1100,
    ),
    Course(
      id: '3',
      title: 'Kỹ năng Đọc',
      description: 'Khóa học chú trọng chiến lược đọc nhanh, đọc lấy ý chính, phân tích cấu trúc câu phức tạp và mở rộng vốn từ học thuật qua các bài báo, truyện ngắn, và tài liệu chuyên ngành.',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/8750/8750683.png',
      instructorId: 'inst_3',
      categoryId: '3',
      price: 100000,
      lessons: _createReadingLessons(),
      level: 'Cơ bản',
      requirements: [
        'Trình độ tiếng Anh sơ cấp',
        'Khả năng nhận diện từ vựng cơ bản',
      ],
      whatYouWillLearn: [
        'Chiến lược đọc nhanh',
        'Cách đoán nghĩa từ mới dựa vào ngữ cảnh',
        'Phân tích câu dài và đoạn văn',
        'Cải thiện khả năng đọc hiểu tài liệu học tập',
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      updatedAt: DateTime.now(),
      rating: 4.5,
      reviewCount: 432,
      enrollmentCount: 1110,
    ),
    Course(
      id: '2',
      title: 'Kỹ năng Viết',
      description: 'Khóa học xây dựng kỹ năng viết từ câu đến đoạn, viết email, bài luận, và cải thiện khả năng diễn đạt tự nhiên. Tập trung vào ngữ pháp, bố cục hợp lý và cách dùng từ chính xác.',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/4659/4659027.png',
      instructorId: 'inst_4',
      categoryId: '4',
      price: 100000,
      lessons: _createWritingLessons(),
      level: 'Cơ bản',
      requirements: [
        'Hiểu cấu trúc câu cơ bản',
        'Biết sử dụng từ vựng phổ thông',
      ],
      whatYouWillLearn: [
        'Viết câu rõ ràng, mạch lạc',
        'Tạo lập đoạn văn theo đúng cấu trúc',
        'Viết email, bài luận và báo cáo chuyên nghiệp',
        'Sử dụng từ vựng chính xác, phù hợp văn phong',
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      updatedAt: DateTime.now(),
      rating: 4.5,
      reviewCount: 321,
      enrollmentCount: 1200,
    ),
  ];

  static final List<Quiz> quizzes = [
    Quiz(
      id: '1',
      title: 'Kiểm tra từ vựng',
      description: 'Kiểm tra một số từ vựng cơ bản',
      timeLimit: 30,
      questions: _createBasicWordQuizQuestions(),
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      isActive: true,
    ),
    Quiz(
      id: '2',
      title: 'Kiểm tra đọc',
      description: 'Kiểm tra kỹ năng đọc',
      timeLimit: 45,
      questions: _createReadingQuizQuestions(),
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      isActive: true,
    ),
  ];

  static final List<QuizAttempt> quizAttempts = [];

  static List<Lesson> _createListeningLessons() {
    return [
      Lesson(
        id: '1',
        title: 'Giới thiệu khóa học',
        description: 'Tổng quan mục tiêu khóa học, cách học hiệu quả, và công cụ luyện nghe được sử dụng.',
        videoUrl: '',
        duration: 30,
        resources: _createDummyResources(),
        isPreview: true,
        isLocked: false,
      ),
      _createLesson('2', 'Luyện nghe từ dễ đến nâng cao', false, false),
      _createLesson('3', 'Cách nhận biết từ khóa (keyword)', false, false),
      _createLesson('4', 'Phân biệt giọng Anh – Mỹ – Úc', false, false),
      _createLesson('5', 'Nghe qua video và podcast thực tế', false, false),

    ];
  }

  static List<Lesson> _createSpeakingLessons() {
    return [
      _createLesson('1', 'Giới thiệu khóa học', true, false),
      _createLesson('2', 'Luyện phát âm chuẩn qua IPA', false, false),
      _createLesson('3', 'Ngữ điệu và Nhịp nói tự nhiên', false, false),
      _createLesson('4', 'Phản xạ nói qua hội thoại ngắn', false, false),
      _createLesson('5', 'Giao tiếp nâng cao: phỏng vấn & thuyết trình', false, false),

    ];
  }

  static List<Lesson> _createReadingLessons() {
    return [
      _createLesson('1', 'Giới thiệu khóa học', true, false),
      _createLesson('2', 'Đọc nhanh và phát hiện từ khóa (keyword)', false, false),
      _createLesson('3', 'Tìm kiếm thông tin cụ thể', false, false),
      _createLesson('4', 'Đoán nghĩa từ dựa vào ngữ cảnh', false, false),
      _createLesson('5', 'Đọc hiểu bài một học văn', false, false),

    ];
  }

  static List<Lesson> _createWritingLessons() {
    return [
      _createLesson('1', 'Giới thiệu khóa học', true, false),
      _createLesson('2', 'Viết câu rõ ràng và chính xác', false, false),
      _createLesson('3', 'Tạo lập đoạn văn hiệu quả', false, false),
      _createLesson('4', 'Viết email và thông điệp ngắn chuyên nghiệp', false, false),
      _createLesson('5', 'Viết một bài văn hoàn chỉnh', false, false),

    ];
  }

  static Lesson _createLesson(String id, String title, bool isPreview,
      bool isCompleted) {
    return Lesson(
      id: 'lesson_$id',
      title: title,
      description: '$title',
      videoUrl: '',
      duration: 30,
      resources: _createDummyResources(),
      isPreview: isPreview,
      isLocked: !isPreview,
      isCompleted: isCompleted,
    );
  }

  static List<Resource> _createDummyResources(){
    return[
      Resource(
        id: 'res_1',
        title: 'Tài liệu học tập',
        type: 'pdf',
        url: '',
      ),
    ];
  }

  static Course getCourseById(String id){
    return courses.firstWhere(
          (courses) => courses.id == id,
          orElse: () => courses.first,
    );
  }

  static List<Course> getCourseByCategory(String categoryId){
    return courses.where((course) => course.categoryId == categoryId).toList();
  }

  static List<Course> getInstructorCourses(String instructorId){
    return courses.where((courses) => courses.instructorId == instructorId).toList();
  }

  static bool isCourseCompleted(String courseId){
    final course = getCourseById(courseId);
    return course.lessons.every((lesson) => lesson.isCompleted);
  }

  static List<Question> _createBasicWordQuizQuestions() {
    return [
      Question(
        id: '1',
        text: '“Happy” có nghĩa là gì?',
        options: [
          Option(id: 'A', text: 'Buồn'),
          Option(id: 'B', text: 'Vui'),
          Option(id: 'C', text: 'Tức giận'),
          Option(id: 'D', text: 'Lo lắng'),
        ],
        correctOptionId: 'B',
        points: 1,
      ),
      Question(
        id: '2',
        text: '“Book” có nghĩa là gì?',
        options: [
          Option(id: 'A', text: 'Cuốn sách'),
          Option(id: 'B', text: 'Cái bàn'),
          Option(id: 'C', text: 'Quyển vở'),
          Option(id: 'D', text: 'Tờ báo'),
        ],
        correctOptionId: 'A',
        points: 1,
      ),
      Question(
        id: '3',
        text: '“Cat” là con gì?',
        options: [
          Option(id: 'A', text: 'Con chó'),
          Option(id: 'B', text: 'Con mèo'),
          Option(id: 'C', text: 'Con cá'),
          Option(id: 'D', text: 'Con chim'),
        ],
        correctOptionId: 'B',
        points: 1,
      ),
      Question(
        id: '4',
        text: 'Từ “Hot” trái nghĩa với từ nào?',
        options: [
          Option(id: 'A', text: 'Warm'),
          Option(id: 'B', text: 'Cool'),
          Option(id: 'C', text: 'Cold'),
          Option(id: 'D', text: 'Heat'),
        ],
        correctOptionId: 'C',
        points: 1,
      ),
      Question(
        id: '5',
        text: '“Teacher” nghĩa là gì?',
        options: [
          Option(id: 'A', text: 'Học sinh'),
          Option(id: 'B', text: 'Bác sĩ'),
          Option(id: 'C', text: 'Giáo viên'),
          Option(id: 'D', text: 'Thợ xây'),
        ],
        correctOptionId: 'C',
        points: 1,
      ),
      Question(
        id: '6',
        text: '“Fast” có nghĩa là gì?',
        options: [
          Option(id: 'A', text: 'Chậm'),
          Option(id: 'B', text: 'Nhanh'),
          Option(id: 'C', text: 'To'),
          Option(id: 'D', text: 'Nhỏ'),
        ],
        correctOptionId: 'B',
        points: 1,
      ),
      Question(
        id: '7',
        text: '“Apple” là loại gì?',
        options: [
          Option(id: 'A', text: 'Rau'),
          Option(id: 'B', text: 'Thịt'),
          Option(id: 'C', text: 'Hoa'),
          Option(id: 'D', text: 'Trái cây'),
        ],
        correctOptionId: 'D',
        points: 1,
      ),
      Question(
        id: '8',
        text: '“Run” có nghĩa là?',
        options: [
          Option(id: 'A', text: 'Chạy'),
          Option(id: 'B', text: 'Nhảy'),
          Option(id: 'C', text: 'Bơi'),
          Option(id: 'D', text: 'Leo'),
        ],
        correctOptionId: 'A',
        points: 1,
      ),
      Question(
        id: '9',
        text: '“Water” là gì?',
        options: [
          Option(id: 'A', text: 'Không khí'),
          Option(id: 'B', text: 'Nước'),
          Option(id: 'C', text: 'Lửa'),
          Option(id: 'D', text: 'Đất'),
        ],
        correctOptionId: 'B',
        points: 1,
      ),
      Question(
        id: '10',
        text: '“Big” đồng nghĩa với?',
        options: [
          Option(id: 'A', text: 'Small'),
          Option(id: 'B', text: 'Tiny'),
          Option(id: 'C', text: 'Large'),
          Option(id: 'D', text: 'Short'),
        ],
        correctOptionId: 'C',
        points: 1,
      ),
    ];
  }

  static List<Question> _createReadingQuizQuestions() {
    return [
      Question(
        id: '1',
        text: '"Tom wakes up early every morning. He eats breakfast, then walks to school. His favorite subject is Science because he likes doing experiments." Câu hỏi: Tom làm gì đầu tiên vào buổi sáng?',
        options: [
          Option(id: 'A', text: 'Đi học'),
          Option(id: 'B', text: 'Ăn sáng'),
          Option(id: 'C', text: 'Thức dậy'),
          Option(id: 'D', text: 'Làm thí nghiệm'),
        ],
        correctOptionId: 'C',
        points: 1,
      ),
      Question(
        id: '2',
        text: '"Tom wakes up early every morning. He eats breakfast, then walks to school. His favorite subject is Science because he likes doing experiments." Câu hỏi: Tom đi đến trường bằng cách nào?',
        options: [
          Option(id: 'A', text: 'Đi xe đạp'),
          Option(id: 'B', text: 'Đi bộ'),
          Option(id: 'C', text: 'Đi xe bus'),
          Option(id: 'D', text: 'Đi ô tô'),
        ],
        correctOptionId: 'B',
        points: 1,
      ),
      Question(
        id: '3',
        text: '"Tom wakes up early every morning. He eats breakfast, then walks to school. His favorite subject is Science because he likes doing experiments." Câu hỏi: Môn học Tom thích nhất là gì?',
        options: [
          Option(id: 'A', text: 'Toán'),
          Option(id: 'B', text: 'Văn'),
          Option(id: 'C', text: 'Khoa học'),
          Option(id: 'D', text: 'Lịch sử'),
        ],
        correctOptionId: 'C',
        points: 1,
      ),
      Question(
        id: '4',
        text: '"Tom wakes up early every morning. He eats breakfast, then walks to school. His favorite subject is Science because he likes doing experiments." Câu hỏi: Vì sao Tom thích môn học đấy?',
        options: [
          Option(id: 'A', text: 'Vì dễ học'),
          Option(id: 'B', text: 'Vì thầy cô vui tính'),
          Option(id: 'C', text: 'Vì thích làm thí nghiệm'),
          Option(id: 'D', text: 'Vì bạn bè thích'),
        ],
        correctOptionId: 'C',
        points: 1,
      ),
      Question(
        id: '5',
        text: '"Tom wakes up early every morning. He eats breakfast, then walks to school. His favorite subject is Science because he likes doing experiments." Câu hỏi: Hành động diễn ra sau khi Tom ăn sáng là gì?',
        options: [
          Option(id: 'A', text: 'Thức dậy'),
          Option(id: 'B', text: 'Đi ngủ'),
          Option(id: 'C', text: 'Đi bộ đến trường'),
          Option(id: 'D', text: 'Học bài'),
        ],
        correctOptionId: 'C',
        points: 1,
      ),
      Question(
        id: '6',
        text: '"Tom wakes up early every morning. He eats breakfast, then walks to school. His favorite subject is Science because he likes doing experiments." Câu hỏi: Từ “experiments” trong đoạn văn có nghĩa là?',
        options: [
          Option(id: 'A', text: 'Bài tập'),
          Option(id: 'B', text: 'Thí nghiệm'),
          Option(id: 'C', text: 'Bài kiểm tra'),
          Option(id: 'D', text: 'Dự án'),
        ],
        correctOptionId: 'B',
        points: 1,
      ),
      Question(
        id: '7',
        text: '"Tom wakes up early every morning. He eats breakfast, then walks to school. His favorite subject is Science because he likes doing experiments." Câu hỏi: Đoạn văn có ý nói Tom là người như thế nào?',
        options: [
          Option(id: 'A', text: 'Lười biếng'),
          Option(id: 'B', text: 'Thức dậy muộn'),
          Option(id: 'C', text: 'Thức dậy sớm'),
          Option(id: 'D', text: 'Tom Không thích đi học'),
        ],
        correctOptionId: 'C',
        points: 1,
      ),
      Question(
        id: '8',
        text: '"Tom wakes up early every morning. He eats breakfast, then walks to school. His favorite subject is Science because he likes doing experiments." Câu hỏi: Hoạt động nào không được nhắc đến trong đoạn văn?',
        options: [
          Option(id: 'A', text: 'Tom ăn sáng'),
          Option(id: 'B', text: 'Tom đi bộ'),
          Option(id: 'C', text: 'Tom đọc sách'),
          Option(id: 'D', text: 'Tom làm thí nghiệm'),
        ],
        correctOptionId: 'C',
        points: 1,
      ),
      Question(
        id: '9',
        text: '"Tom wakes up early every morning. He eats breakfast, then walks to school. His favorite subject is Science because he likes doing experiments." Câu hỏi: Đoạn văn chủ yếu nói về điều gì?',
        options: [
          Option(id: 'A', text: 'Gia đình của Tom'),
          Option(id: 'B', text: 'Một ngày đi học của Tom'),
          Option(id: 'C', text: 'Những môn Tom không thích'),
          Option(id: 'D', text: 'Nhà của Tom'),
        ],
        correctOptionId: 'B',
        points: 1,
      ),
      Question(
        id: '10',
        text: '"Tom wakes up early every morning. He eats breakfast, then walks to school. His favorite subject is Science because he likes doing experiments." Câu hỏi: Từ “favorite” gần nghĩa nhất với?',
        options: [
          Option(id: 'A', text: 'Ghét nhất'),
          Option(id: 'B', text: 'Quan trọng nhất'),
          Option(id: 'C', text: 'Yêu thích nhất'),
          Option(id: 'D', text: 'Khó nhất'),
        ],
        correctOptionId: 'C',
        points: 1,
      ),
    ];
  }

  static Quiz getQuizById(String id){
    return quizzes.firstWhere(
          (quiz) => quiz.id == id,
          orElse: () => quizzes.first,
    );
  }

  static void saveQuizAttempt(QuizAttempt attempt){
    quizAttempts.add(attempt);
  }

  static List<QuizAttempt> getQuizAttempt(String userId){
    return quizAttempts.where((attempt) => attempt.userId == userId).toList();
  }

  // add a set to store purchased course IDs
  static final Set<String> _purchasedCourseIds = {};

  // add methods to manage purchased courses
  static bool isCourseUnlocked(String courseId){
    final course = getCourseById(courseId);
    return !course.isPremium || _purchasedCourseIds.contains(courseId);
  }

  static void addPurchasedCourse(String courseId){
    _purchasedCourseIds.add(courseId);
  }

  // Teacher-specific dummy data
  static final Map<String, TeacherStats> teacherStats = {
    'ints_1': TeacherStats(
      totalStudents: 1234,
      activeCourses: 8,
      totalRevenue: 12345.67,
      averageRating: 4.8,
      monthlyEnrollments: [156, 189, 234, 278, 312, 289],
      monthlyRevenue: [1234, 1567, 1890, 2100, 2345, 2189],
      studentEngagement: StudentEngagement(
        averageCompletionRate: 0.78,
        averageTimePerLesson: 45,
        activeStudentsThisWeek: 156,
        courseCompletionRates: {
          'Kỹ năng nghe': 0.85,
          'Kỹ năng nói': 0.72,
          'Kỹ năng đọc': 0.68,
          'Kỹ năng viết': 0.75,
        },
      ),
    ),
  };

  static final Map<String, List<StudentProgress>> studentProgress = {
    'inst_1': [
      StudentProgress(
        studentId: 'student_1',
        studentName: 'ABC',
        courseId: '1',
        courseName: 'Kỹ năng nghe',
        progress: 0.70,
        lastActive: DateTime.now().subtract(const Duration(hours: 2)),
        quizScores: [10, 8],
        completedLessons: 2,
        totalLessons: 4,
        averageTimePerLesson: 45,
      ),
      StudentProgress(
        studentId: 'student_2',
        studentName: 'XYZ',
        courseId: '1',
        courseName: 'Kỹ năng đọc',
        progress: 0.60,
        lastActive: DateTime.now().subtract(const Duration(days: 1)),
        quizScores: [8, 6],
        completedLessons: 1,
        totalLessons: 3,
        averageTimePerLesson: 38,
      ),
    ]
  };

  // Helper methods to get teacher-specific data
  static TeacherStats getTeacherStats(String instructorId){
    final instructorCourse = getInstructorCourses(instructorId);
    final stats = teacherStats[instructorId] ?? TeacherStats.empty();

    // Calculate stats based on instructor's courses only
    return TeacherStats(
      totalStudents: instructorCourse.fold(0, (sum, course) => sum + course.enrollmentCount),
      activeCourses: instructorCourse.length,
      totalRevenue: instructorCourse.fold(0.0, (sum, course) => sum + (course.price * course.enrollmentCount)),
      averageRating: instructorCourse.isEmpty ? 0.0 :
          instructorCourse.fold(0.0, (sum, course) => sum + course.rating) / instructorCourse.length,
      monthlyEnrollments: stats.monthlyEnrollments,
      monthlyRevenue: stats.monthlyRevenue,
      studentEngagement: stats.studentEngagement,
    );
  }

  static List<StudentProgress> getStudentProgress(String instructorId){
    final instructorCourses = getInstructorCourses(instructorId);
    final courseIds = instructorCourses.map((c) => c.id).toSet();

    // Filter student progress for instructor's courses only
    return studentProgress[instructorId]?.where(
    (progress) => courseIds.contains(progress.courseId)
    ).toList() ?? [];
  }

  static Stream<List<ChatMessage>> getChatMessages(String courseId){
    return Stream.value(_dummyChats.values
    .expand((messages) => messages)
    .where((msg) => msg.courseId == courseId)
    .toList());
  }

  static Stream<List<ChatMessage>> getTeacherChats(String instructorId){
    return Stream.value(_dummyChats[instructorId] ?? []);
  }

  static Map<String, List<ChatMessage>> getTeacherChatsByCourse(String instructorId){
    final Map<String, List<ChatMessage>> chatsByCourse = {};
    final messages = _dummyChats[instructorId] ?? [];

    for (var message in messages){
      if (!chatsByCourse.containsKey(message.courseId)){
        chatsByCourse[message.courseId] = [];
      }
      chatsByCourse[message.courseId]!.add(message);
    }
    return chatsByCourse;
  }

  static final Map<String, List<ChatMessage>> _dummyChats = {
    'inst_1': [
      ChatMessage(
        id: '1',
        senderId: 'student_1',
        receiverId: 'inst_1',
        courseId: '1',
        message: 'Thưa thầy, em có điều muốn hỏi',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      ChatMessage(
        id: '2',
        senderId: 'student_1',
        receiverId: 'inst_1',
        courseId: '1',
        message: 'Khi nào có bài học tiếp theo ạ',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      ChatMessage(
        id: '3',
        senderId: 'student_4',
        receiverId: 'inst_1',
        courseId: '2',
        message: 'Thầy có thể làm thêm bài kiểm tra được không ạ',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      ),
    ],
  };

  static void updateLessonStatus(String courseId, String lessonId, {bool? isCompleted, bool? isLocked}){
    final courseIndex = courses.indexWhere((c) => c.id == courseId);
    if (courseIndex != -1){
      final course = courses[courseIndex];
      final lessonIndex = course.lessons.indexWhere((l) => l.id == lessonId);

      if (lessonIndex != -1){
        var updatedLesson = course.lessons[lessonIndex].copyWith(
          isCompleted: isCompleted ?? course.lessons[lessonIndex].isCompleted,
          isLocked: isLocked ?? course.lessons[lessonIndex].isLocked,
        );
        courses[courseIndex].lessons[lessonIndex] = updatedLesson;
      }
    }
  }

  static bool isLessonCompleted(String courseId, String lessonId){
    final course = getCourseById(courseId);
    return course.lessons.firstWhere(
        (l) => l.id == lessonId,
      orElse: () => Lesson(
        id: '',
        title: '',
        description: '',
        videoUrl: '',
        duration: 0,
        resources: [],
      ),
    ).isCompleted;
  }
}

// New classes to support teacher-specific data
class TeacherStats{
  final int totalStudents;
  final int activeCourses;
  final double totalRevenue;
  final double averageRating;
  final List<int> monthlyEnrollments;
  final List<double> monthlyRevenue;
  final StudentEngagement studentEngagement;

  TeacherStats({
    required this.totalStudents,
    required this.activeCourses,
    required this.totalRevenue,
    required this.averageRating,
    required this.monthlyEnrollments,
    required this.monthlyRevenue,
    required this.studentEngagement,
  });

  factory TeacherStats.empty() => TeacherStats(
    totalStudents: 0,
    activeCourses: 0,
    totalRevenue: 0,
    averageRating: 0,
    monthlyEnrollments: [],
    monthlyRevenue: [],
    studentEngagement: StudentEngagement.empty(),
  );
}

class StudentEngagement {
  final double averageCompletionRate;
  final int averageTimePerLesson;
  final int activeStudentsThisWeek;
  final Map<String, double> courseCompletionRates;

  StudentEngagement({
    required this.averageCompletionRate,
    required this.averageTimePerLesson,
    required this.activeStudentsThisWeek,
    required this.courseCompletionRates,
  });

  factory StudentEngagement.empty() => StudentEngagement(
    averageCompletionRate: 0,
    averageTimePerLesson: 0,
    activeStudentsThisWeek: 0,
    courseCompletionRates: {},
  );
}

class StudentProgress {
  final String studentId;
  final String studentName;
  final String courseId;
  final String courseName;
  final double progress;
  final DateTime lastActive;
  final List<int> quizScores;
  final int completedLessons;
  final int totalLessons;
  final int averageTimePerLesson;

  double get averageScore{
    if (quizScores.isEmpty) return 0.0;
    return quizScores.reduce((a, b) => a + b) / quizScores.length / 100;
  }

  StudentProgress({
    required this.studentId,
    required this.studentName,
    required this.courseId,
    required this.courseName,
    required this.progress,
    required this.lastActive,
    required this.quizScores,
    required this.completedLessons,
    required this.totalLessons,
    required this.averageTimePerLesson,
  });
}