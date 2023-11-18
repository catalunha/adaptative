import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/controllers.dart';
import '../controller/states.dart';

class TodoUpdatePageSmall extends StatefulWidget {
  const TodoUpdatePageSmall({super.key});

  @override
  State<TodoUpdatePageSmall> createState() => _TodoUpdatePageSmallState();
}

class _TodoUpdatePageSmallState extends State<TodoUpdatePageSmall> {
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
    final task = context.read<TaskUpdateCubit>().task;
    if (task != null) {
      title.text = task.title;
      description.text = task.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocListener<TaskUpdateCubit, TaskState>(
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
                  if (context.read<TaskUpdateCubit>().task != null)
                    const Text('Editar ou apagar um ToDo2'),
                  if (context.read<TaskUpdateCubit>().task == null)
                    const Text('Criar um ToDo2'),
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
                  BlocBuilder<TaskUpdateCubit, TaskState>(
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
                                            .read<TaskUpdateCubit>()
                                            .update(
                                              title: title.text,
                                              description: description.text,
                                            );
                                      },
                                      child: const Text('Save'),
                                    ),
                                  )
                                ],
                              ),
                              if (context.read<TaskUpdateCubit>().task != null)
                                ElevatedButton(
                                  onPressed: () async {
                                    await context
                                        .read<TaskUpdateCubit>()
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
                            await context.read<TaskUpdateCubit>().create(
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
