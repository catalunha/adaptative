import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../list/controller/controllers.dart';
import '../controller/controllers.dart';
import '../controller/states.dart';
import '../widgets/form_description_widget.dart';
import '../widgets/form_title_widget.dart';
import '../widgets/save_widget.dart';
import '../widgets/title_widget.dart';

class TodoInsertMediumComp extends StatefulWidget {
  const TodoInsertMediumComp({super.key});

  @override
  State<TodoInsertMediumComp> createState() => _TodoInsertMediumCompState();
}

class _TodoInsertMediumCompState extends State<TodoInsertMediumComp> {
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
          context.read<TaskListController>().loading();
        }
      },
      child: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 50, right: 30, top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('ToDo Criar (TodoInsertPageMedium)'),
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
                            title: title, description: description);
                      case TaskStateStatus.loading:
                        return const Center(child: CircularProgressIndicator());
                      case TaskStateStatus.loaded:
                        return SaveWidget(
                            title: title, description: description);
                      case TaskStateStatus.error:
                        return Center(
                            child: Text(state.error ?? 'Oops. Erro sem msg'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
