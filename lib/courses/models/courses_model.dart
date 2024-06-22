class CourseModel {
  final int courseId;
  final String courseName;

  CourseModel({required this.courseId, required this.courseName});

  @override
  String toString() {
    return 'CourseModel{courseId: $courseId, courseName: $courseName}';
  }

  CourseModel copyWith({
    int? courseId,
    String? courseName,
  }) {
    return CourseModel(
      courseId: courseId ?? this.courseId,
      courseName: courseName ?? this.courseName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'courseId': courseId,
      'courseName': courseName,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      courseId: map['course_id'],
      courseName: map['course_name'],
    );
  }


}