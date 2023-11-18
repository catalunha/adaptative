import 'package:flutter/material.dart';

import '../../utils/layout.dart';
import 'layouts/todo_update_page_large.dart';
import 'layouts/todo_update_page_medium.dart';
import 'layouts/todo_update_page_small.dart';

class TodoUpdatePage extends StatelessWidget {
  const TodoUpdatePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Layout(
      small: TodoUpdatePageSmall(),
      medium: TodoUpdatePageMedium(),
      large: TodoUpdatePageLarge(),
    );
  }
}
