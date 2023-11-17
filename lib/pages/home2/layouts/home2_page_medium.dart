import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_loader.dart';
import '../../utils/app_messages.dart';
import '../controller/controllers.dart';
import '../controller/states.dart';
import '../widgets/task_list.dart';

class Home2PageMedium extends StatefulWidget {
  const Home2PageMedium({super.key});

  @override
  State<Home2PageMedium> createState() => _Home2PageMediumState();
}

class _Home2PageMediumState extends State<Home2PageMedium>
    with AppLoader, AppMessages {
  @override
  Widget build(BuildContext context) {
    log('Home2PageMedium.build');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de ToDo's em LMedium2"),
      ),
      body: BlocListener<Home2PageController, Home2PageState>(
        listenWhen: (previous, current) {
          log('Listener.runtimeType ${previous.runtimeType} - ${current.runtimeType}');
          return previous.runtimeType != current.runtimeType;
        },
        listener: (context, state) async {
          log('Listener...');
          log('Listener.state ${state.runtimeType}');
          switch (state.status) {
            case Home2PageStatus.initial:
              log('Listener Initial');
              break;
            case Home2PageStatus.loading:
              log('Listener Loading');
              showLoader(context);
            case Home2PageStatus.loaded:
              log('Listener Loaded');
              hideLoader(context);
            case Home2PageStatus.error:
              log('Listener Error');
              hideLoader(context);
              showMessageError(context, state.statusMessage);
          }
        },
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await context.read<Home2PageController>().loading();
              },
              child: const Text('Reloading...'),
            ),
            Flexible(
              child: BlocBuilder<Home2PageController, Home2PageState>(
                builder: (context, state) {
                  return TaskList(
                    tasks: state.tasks,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
