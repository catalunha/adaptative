import 'package:adaptative/pages/todo/insert/widgets/form_description_widget.dart';
import 'package:adaptative/pages/todo/insert/widgets/form_title_widget.dart';
import 'package:adaptative/pages/todo/insert/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/controllers.dart';
import '../controller/states.dart';
import '../widgets/save_widget.dart';

class TodoInsertPageSmall extends StatefulWidget {
  const TodoInsertPageSmall({super.key});

  @override
  State<TodoInsertPageSmall> createState() => _TodoInsertPageSmallState();
}

class _TodoInsertPageSmallState extends State<TodoInsertPageSmall> {
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
    return Dialog(
      child: BlocListener<TaskInsertCubit, TaskState>(
        listener: (context, state) {
          if (state is TaskStateLoaded) {
            Navigator.of(context).pop(true);
          }
        },
        child: SizedBox(
          height: 400,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TitleWidget(),
                  FormTitleWidget(title: title),
                  const SizedBox(height: 20),
                  FormDescriptionWidget(description: description),
                  const SizedBox(height: 20),
                  BlocBuilder<TaskInsertCubit, TaskState>(
                    builder: (context, state) {
                      switch (state) {
                        case TaskStateInitial():
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
                                child: SaveWidget(
                                    title: title, description: description),
                              )
                            ],
                          );
                        case TaskStateLoading():
                          return const Center(
                              child: CircularProgressIndicator());
                        case TaskStateLoaded():
                          return const SizedBox();
                        case TaskStateError():
                          return Center(
                              child: Column(
                            children: [
                              Text(state.error ?? 'Oops. Erro sem msg'),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: const Text('Voltar'),
                              ),
                            ],
                          ));
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
