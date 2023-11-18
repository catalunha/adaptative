import 'package:flutter/material.dart';

import '../../../routes.dart';

class HomePageUnique extends StatelessWidget {
  const HomePageUnique({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - Unique'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(RouteName.todoList);
                },
                child: const Text('Go to ToDo'))
          ],
        ),
      ),
    );
  }
}
