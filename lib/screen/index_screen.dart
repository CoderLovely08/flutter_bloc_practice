import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc State Management'),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ListTile(
                title: const Text('Counter Screen'),
                subtitle: const Text('Counter Screen using Bloc'),
                onTap: () {
                  Navigator.pushNamed(context, '/counter_screen');
                },
              ),
              ListTile(
                title: const Text('Counter Manage Screen'),
                subtitle: const Text('Counter Manage Screen using Bloc'),
                onTap: () {
                  Navigator.pushNamed(context, '/counter_manage_screen');
                },
              ),
              ListTile(
                title: const Text('Todo Screen'),
                subtitle: const Text('Todo Screen using Cubit'),
                onTap: () {
                  Navigator.pushNamed(context, '/todo_screen');
                },
              ),
              ListTile(
                title: const Text('Courses Screen'),
                subtitle: const Text('Courses Screen using Bloc'),
                onTap: () {
                  Navigator.pushNamed(context, '/courses_screen');
                },
              ),
            ],
          )),
    );
  }
}
