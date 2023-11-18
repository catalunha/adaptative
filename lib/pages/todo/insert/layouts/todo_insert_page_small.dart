import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/controllers.dart';
import '../controller/states.dart';

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
                  const Text('Criar um ToDo (TodoInsertPageSmall)'),
                  TextFormField(
                    controller: title,
                    decoration: const InputDecoration(hintText: 'Titulo'),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: description,
                    decoration: const InputDecoration(hintText: 'Descrição'),
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<TaskInsertCubit, TaskState>(
                    builder: (context, state) {
                      switch (state) {
                        case TaskStateInitial():
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                        await context
                                            .read<TaskInsertCubit>()
                                            .insert(
                                              title: title.text,
                                              description: description.text,
                                            );
                                      },
                                      child: const Text('Save'),
                                    ),
                                  )
                                ],
                              ),
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
