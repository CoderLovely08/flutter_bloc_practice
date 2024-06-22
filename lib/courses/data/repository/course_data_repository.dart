import 'package:bloc_practice/courses/data/provider/course_data_provider.dart';
import 'package:bloc_practice/courses/models/courses_model.dart';

class CourseRepository {
  final CourseDataProvider courseDataProvider;

  CourseRepository(this.courseDataProvider);

  Future<List<CourseModel>> getAllCourses() async {
    try {
      final courses = await courseDataProvider.fetchCourses();

      if (courses['success']) {
        final List<CourseModel> courseList = [];
        for (var course in courses['data']) {
          courseList.add(CourseModel.fromMap(course));
        }
        return courseList;
      } else {
        throw Exception(courses['message']);
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
