import 'dart:developer';

import 'package:flutter/material.dart';

class TodoListPageLarge extends StatelessWidget {
  const TodoListPageLarge({super.key});

  @override
  Widget build(BuildContext context) {
    log('TodoListPageMedium.build');

    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo - List - Large"),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
