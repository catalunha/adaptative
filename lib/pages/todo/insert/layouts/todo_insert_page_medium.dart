import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../list/controller/controllers.dart';
import '../controller/controllers.dart';
import '../controller/states.dart';
import '../widgets/save_medium_widget.dart';

class TodoInsertPageMedium extends StatefulWidget {
  const TodoInsertPageMedium({super.key});

  @override
  State<TodoInsertPageMedium> createState() => _TodoInsertPageMediumState();
}

class _TodoInsertPageMediumState extends State<TodoInsertPageMedium> {
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
        if (state is TaskStateLoaded) {
          context.read<TaskListController>().loading();
          title.text = '';
          description.text = '';
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
                    const Text('Criar um ToDo (TodoInsertPageMedium)'),
                    TextFormField(
                      controller: title,
                      decoration: const InputDecoration(hintText: 'Titulo'),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: description,
                      decoration: const InputDecoration(hintText: 'Descrição'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: BlocBuilder<TaskInsertCubit, TaskState>(
                  builder: (context, state) {
                    switch (state) {
                      case TaskStateInitial():
                        return SaveMediumWidget(
                            title: title, description: description);
                      case TaskStateLoading():
                        return const Center(child: CircularProgressIndicator());
                      case TaskStateLoaded():
                        return SaveMediumWidget(
                            title: title, description: description);
                      case TaskStateError():
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
