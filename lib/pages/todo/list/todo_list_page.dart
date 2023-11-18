import 'package:flutter/material.dart';

import '../../utils/layout.dart';
import 'layouts/todo_list_page_large.dart';
import 'layouts/todo_list_page_medium.dart';
import 'layouts/todo_list_page_small.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Layout(
      small: TodoListPageSmall(),
      medium: TodoListPageMedium(),
      large: TodoListPageLarge(),
    );
  }
}
