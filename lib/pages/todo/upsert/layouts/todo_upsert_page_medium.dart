import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/controllers.dart';
import '../controller/states.dart';

class TodoUpsertPageMedium extends StatefulWidget {
  const TodoUpsertPageMedium({super.key});

  @override
  State<TodoUpsertPageMedium> createState() => _TodoUpsertPageMediumState();
}

class _TodoUpsertPageMediumState extends State<TodoUpsertPageMedium> {
  final title = TextEditingController();
  final description = TextEditingController();
  @override
  void dispose() {
    title.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final task = context.read<TaskController>().task;
    if (task != null) {
      title.text = task.title;
      description.text = task.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocListener<TaskController, TaskState>(
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
                  if (context.read<TaskController>().task != null)
                    const Text('Editar ou apagar um ToDo'),
                  if (context.read<TaskController>().task == null)
                    const Text('Criar um ToDo'),
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
                  BlocBuilder<TaskController, TaskState>(
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
                                            .read<TaskController>()
                                            .create(
                                              title: title.text,
                                              description: description.text,
                                            );
                                      },
                                      child: const Text('Save'),
                                    ),
                                  )
                                ],
                              ),
                              if (context.read<TaskController>().task != null)
                                ElevatedButton(
                                  onPressed: () async {
                                    await context
                                        .read<TaskController>()
                                        .delete();
                                  },
                                  child: const Text('Delete'),
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

/*
                      return ElevatedButton(
                          onPressed: () async {
                            await context.read<TaskController>().create(
                                  title: title.text,
                                  description: description.text,
                                );
                          },
                          child: const Text('Save'));
                          */
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
