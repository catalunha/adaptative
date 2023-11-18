import 'package:adaptative/pages/todo/insert/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveSmallWidget extends StatelessWidget {
  const SaveSmallWidget({
    super.key,
    required this.title,
    required this.description,
  });

  final TextEditingController title;
  final TextEditingController description;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 100,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Voltar'),
          ),
        ),
        SizedBox(
          width: 100,
          child: ElevatedButton(
            onPressed: () async {
              await context.read<TaskInsertCubit>().insert(
                    title: title.text,
                    description: description.text,
                  );
              title.text = '';
              description.text = '';
            },
            child: const Text('Save'),
          ),
        )
      ],
    );
  }
}
