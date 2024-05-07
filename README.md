# bloc_practice

A new Flutter project to practice Bloc.

1. Setup bloc provider for the root application
if there's only one single provider use this approach else use **MultiBlocProvider**
```dart
// Wrapping the entire thing with the provider we will be using across the app
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
```

2. Setup Bloc Events
- Single Event
    ```dart
    import 'package:flutter_bloc/flutter_bloc.dart';

    class CounterIncrement extends CounterEvent {}
    // This is for single event
    class CounterBloc extends Bloc<CounterIncrement, int> {
      CounterBloc() : super(0) {
        on<CounterIncrement>((event, emit) {
          emit(state + 1);
        });
      }
    }
    ```

- Multiple Events

    ```dart
    // counter_bloc.dart
    import 'package:flutter_bloc/flutter_bloc.dart';

    class CounterEvent {}

    class CounterIncrement extends CounterEvent{}

    class CounterDecrement extends CounterEvent{};

    class CounterBloc extends Bloc<CounterEvent, int> {
    CounterBloc() : super(0) {
        on<CounterIncrement>((event, emit) {
        emit(state + 1);
        });

        on<CounterDecrement>((event, emit) {
        emit(state - 1);
        });

        on<CounterReset>((event, emit) {
        emit(0);
        });
    }
    }
    ```

3. Usage
- State monitoring
    ```dart
    // Display file where only the state monitoring will  happen
    import 'package:bloc_practice/bloc/counter_bloc.dart';
    import 'package:flutter/material.dart';
    import 'package:flutter_bloc/flutter_bloc.dart';

    class CounterScreen extends StatefulWidget {
    const CounterScreen({super.key});

    @override
    State<CounterScreen> createState() => _CounterScreenState();
    }

    class _CounterScreenState extends State<CounterScreen> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Text('Bloc Counter Screen'),
        ),
        // Specify the bloc which will be managing the state under this tree
        body: BlocBuilder<CounterBloc, int>(
            builder: (context, state) {
            return Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Text(
                    '$state',
                    ),
                ],
                ),
            );
            },
        ),
        );
    }
    }
    ```

- State transforation
    ```dart
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
        // Initialize which bloc we will be working with
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
                        // Alternatively we can use the following
                        // counterBloc.add(CounterReset());
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
                // Emitting events that will trigger the state change
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

    ```
