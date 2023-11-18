import 'package:flutter/material.dart';

import '../../utils/layout.dart';
import 'layouts/todo_insert_page_large.dart';
import 'layouts/todo_insert_page_medium.dart';
import 'layouts/todo_insert_page_small.dart';

class TodoInsertPage extends StatelessWidget {
  const TodoInsertPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Layout(
      small: TodoInsertPageSmall(),
      medium: TodoInsertPageMedium(),
      large: TodoInsertPageLarge(),
    );
  }
}
