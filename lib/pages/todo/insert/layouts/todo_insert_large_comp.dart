import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/controllers.dart';
import '../controller/states.dart';
import '../widgets/form_description_widget.dart';
import '../widgets/form_title_widget.dart';
import '../widgets/save_widget.dart';

class TodoInsertCompLarge extends StatefulWidget {
  const TodoInsertCompLarge({super.key});

  @override
  State<TodoInsertCompLarge> createState() => _TodoInsertCompLargeState();
}

class _TodoInsertCompLargeState extends State<TodoInsertCompLarge> {
  final title = TextEditingController();
  final description = TextEditingController();
  @override
  void dispose() {
    title.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskInsertCubit, TaskState>(
      listener: (context, state) {
        if (state.status.isLoaded) {
          title.text = '';
          description.text = '';
          Navigator.of(context).pop(true);
        }
      },
      child: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 50, right: 30, top: 10, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        const Text('ToDo Criar (TodoInsertPageLarge)'),
                        FormTitleWidget(title: title),
                        const SizedBox(height: 20),
                        FormDescriptionWidget(description: description),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: BlocBuilder<TaskInsertCubit, TaskState>(
                      builder: (context, state) {
                        switch (state.status) {
                          case TaskStateStatus.initial:
                            return SaveWidget(
                              title: title,
                              description: description,
                            );
                          case TaskStateStatus.loading:
                            return const Center(
                                child: CircularProgressIndicator());
                          case TaskStateStatus.loaded:
                            return SaveWidget(
                                title: title, description: description);
                          case TaskStateStatus.error:
                            return Center(
                                child:
                                    Text(state.error ?? 'Oops. Erro sem msg'));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
