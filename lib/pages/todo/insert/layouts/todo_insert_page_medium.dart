import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../list/controller/controllers.dart';
import '../controller/controllers.dart';
import '../controller/states.dart';
import '../widgets/form_description_widget.dart';
import '../widgets/form_title_widget.dart';
import '../widgets/save_widget.dart';
import '../widgets/title_widget.dart';

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
                    const TitleWidget(),
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
                    switch (state) {
                      case TaskStateInitial():
                        return SaveWidget(
                            title: title, description: description);
                      case TaskStateLoading():
                        return const Center(child: CircularProgressIndicator());
                      case TaskStateLoaded():
                        return SaveWidget(
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
