import 'package:bloc_practice/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterManageScreen extends StatefulWidget {
  const CounterManageScreen({super.key});

  @override
  State<CounterManageScreen> createState() => _CounterManageScreenState();
}

class _CounterManageScreenState extends State<CounterManageScreen> {
  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter Manage Screen'),
      ),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterReset());
                  },
                  child: const Text('Reset Counter'),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterIncrement());
            },
            tooltip: 'Increment',
            heroTag: 'add',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterDecrement());
            },
            tooltip: 'Decrement',
            heroTag: 'remove',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
