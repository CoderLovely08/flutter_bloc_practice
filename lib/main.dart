import 'package:bloc_practice/counter_bloc/counter_bloc.dart';
import 'package:bloc_practice/screen/counter_screens/counter_manage_screen.dart';
import 'package:bloc_practice/screen/counter_screens/counter_screen.dart';
import 'package:bloc_practice/screen/index_screen.dart';
import 'package:bloc_practice/screen/todo_screens/todo_list.dart';
import 'package:bloc_practice/todo_cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider<TodoCubit>(
          create: (context) => TodoCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const IndexScreen(),
          '/counter_screen': (context) => const CounterScreen(),
          '/counter_manage_screen': (context) => const CounterManageScreen(),
          '/todo_screen': (context) => const TodoList(),
        },
      ),
    );
  }
}
