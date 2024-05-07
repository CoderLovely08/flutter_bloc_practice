import 'package:bloc_practice/models/todo_mode.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  void addTodo(String title, {bool isDone = false}) {
    final todo = TodoModel(title: title, isDone: isDone);
    state.add(todo);
    emit([...state]);
  }
}
