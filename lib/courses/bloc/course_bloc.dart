import 'package:bloc/bloc.dart';
import 'package:bloc_practice/courses/data/repository/course_data_repository.dart';
import 'package:bloc_practice/courses/models/courses_model.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository _courseRepository;
  CourseBloc(this._courseRepository) : super(CourseInitial()) {
    on<CoursesFetched>(_fetchCourses);
  }

  void _fetchCourses(
    CoursesFetched event,
    Emitter<CourseState> emit,
  ) async {
    emit(CourseLoading());
    try {
      final List<CourseModel> courses = await _courseRepository.getAllCourses();
      emit(CourseSuccess(courses: courses));
    } catch (e) {
      emit(CourseFailure(e.toString()));
    }
  }
}
