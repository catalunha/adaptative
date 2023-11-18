import 'dart:developer';

import 'package:flutter/material.dart';

class TodoListPageMedium extends StatelessWidget {
  const TodoListPageMedium({super.key});

  @override
  Widget build(BuildContext context) {
    log('TodoListPageMedium.build');

    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo - List - Medium"),
        centerTitle: true,
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
