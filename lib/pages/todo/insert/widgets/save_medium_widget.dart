import 'package:adaptative/pages/todo/insert/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveMediumWidget extends StatelessWidget {
  const SaveMediumWidget({
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
        await context.read<TaskInsertCubit>().insert(
              title: title.text,
              description: description.text,
            );
      },
      child: const Text('Save'),
    );
  }
}
