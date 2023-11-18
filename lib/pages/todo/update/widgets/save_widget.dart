import 'package:adaptative/pages/todo/update/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveWidget extends StatelessWidget {
  const SaveWidget({
    super.key,
    required this.title,
    required this.description,
  });

  final TextEditingController title;
  final TextEditingController description;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await context.read<TaskUpdateCubit>().update(
              title: title.text,
              description: description.text,
            );
      },
      child: const Text('Save'),
    );
  }
}
