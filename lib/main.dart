import 'package:bloc_practice/bloc/counter_bloc.dart';
import 'package:bloc_practice/screen/counter_manage_screen.dart';
import 'package:bloc_practice/screen/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CounterScreen(),
        routes: {
          '/counter_manage_screen': (context) => const CounterManageScreen(),
        },
      ),
    );
  }
}