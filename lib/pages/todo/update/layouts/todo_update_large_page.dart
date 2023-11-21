import 'package:adaptative/pages/todo/update/widgets/form_description_widget.dart';
import 'package:adaptative/pages/todo/update/widgets/form_title_widget.dart';
import 'package:adaptative/pages/todo/update/widgets/save_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/controllers.dart';
import '../controller/states.dart';

class TodoUpdateLargePage extends StatefulWidget {
  const TodoUpdateLargePage({super.key});

  @override
  State<TodoUpdateLargePage> createState() => _TodoUpdateLargePageState();
}

class _TodoUpdateLargePageState extends State<TodoUpdateLargePage> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo Editar (TodoUpdatePageLarge)"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ),
      body: BlocListener<TaskUpdateCubit, TaskState>(
        listener: (context, state) {
          if (state.status.isLoaded) {
            Navigator.of(context).pop(true);
          }
        },
        child: Center(
          child: SizedBox(
            width: 500,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FormTitleWidget(title: title),
                  const SizedBox(height: 20),
                  FormDescriptionWidget(description: description),
                  const SizedBox(height: 20),
                  BlocBuilder<TaskUpdateCubit, TaskState>(
                    builder: (context, state) {
                      switch (state.status) {
                        case TaskStateStatus.initial:
                          return Column(
                            children: [
                              SizedBox(
                                width: 100,
                                child: SaveWidget(
                                    title: title, description: description),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: 100,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await context
                                        .read<TaskUpdateCubit>()
                                        .delete();
                                  },
                                  child: const Text('Delete'),
                                ),
                              ),
                            ],
                          );
                        case TaskStateStatus.loading:
                          return const Center(
                              child: CircularProgressIndicator());
                        case TaskStateStatus.loaded:
                          return const SizedBox();
                        case TaskStateStatus.error:
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
                            ),
                          );
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
