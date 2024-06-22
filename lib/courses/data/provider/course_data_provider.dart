import 'dart:convert';

import 'package:http/http.dart' as http;

class CourseDataProvider {
  Future<Map<String, dynamic>> fetchCourses() async {
    try {
      final apiUrl = Uri.parse(
          'https://tutor-verse-bf8239c97f1d.herokuapp.com/api/course');
      final coursesResult = await http.get(apiUrl);

      final result = jsonDecode(coursesResult.body);

      return result;
    } catch (e) {
      return {
        'success': false,
        'message': 'An error occurred while fetching courses',
      };
    }
  }
}
