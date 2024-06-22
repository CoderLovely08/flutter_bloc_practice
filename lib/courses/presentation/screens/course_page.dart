import 'package:bloc_practice/courses/bloc/course_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  void initState() {
    super.initState();
    context.read<CourseBloc>().add(CoursesFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
      ),
      body: Center(
        child: BlocBuilder<CourseBloc, CourseState>(builder: (context, state) {
          // Failed to fetch courses
          if (state is CourseFailure) {
            return Text(state.message);
          }

          // Courses are being fetched
          if (state is! CourseSuccess) {
            return const CircularProgressIndicator();
          }

          final courses = state.courses;

          return ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              return ListTile(
                title: Text(course.courseName),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CourseBloc>().add(CoursesFetched());
        },
        child: const Icon(Icons.refresh),
      )
    );
  }
}
