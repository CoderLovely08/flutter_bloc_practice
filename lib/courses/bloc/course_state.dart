part of 'course_bloc.dart';

sealed class CourseState {}

final class CourseInitial extends CourseState {}

final class CourseSuccess extends CourseState{
  final List<CourseModel> courses;
  CourseSuccess({required this.courses});
}

final class CourseFailure extends CourseState{
  final String message;
  CourseFailure(this.message);
}

final class CourseLoading extends CourseState{}
