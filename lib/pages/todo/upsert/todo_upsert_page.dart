import 'package:flutter/material.dart';

import '../../utils/layout.dart';
import 'layouts/todo_upsert_page_large.dart';
import 'layouts/todo_upsert_page_medium.dart';
import 'layouts/todo_upsert_page_small.dart';

class TodoUpsertPage extends StatelessWidget {
  const TodoUpsertPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Layout(
      small: TodoUpsertPageSmall(),
      medium: TodoUpsertPageMedium(),
      large: TodoUpsertPageLarge(),
    );
  }
}
