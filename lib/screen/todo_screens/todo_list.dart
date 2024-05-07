import 'package:bloc_practice/models/todo_mode.dart';
import 'package:bloc_practice/todo_cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: BlocBuilder<TodoCubit, List<TodoModel>>(
        builder: (context, todos) {
          if (todos.isEmpty) {
            return const Text('No todos yet!');
          } else {
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.isDone.toString()),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String title = Random().nextDouble().toString();
          bool isDone = Random().nextBool();
          context.read<TodoCubit>().addTodo(title, isDone: isDone);
          // BlocProvider.of<TodoCubit>(context).addTodo('New Todo');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}