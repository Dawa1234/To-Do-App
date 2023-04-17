import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo/data/model/task.dart';
import 'package:todo/logic/task/task_bloc.dart';
import 'package:todo/logic/bloc_exports.dart';
import 'package:todo/presentation/screens/tasks/addTask.dart';
import 'package:todo/presentation/screens/tasks/allTasks.dart';
import 'package:todo/presentation/screens/tasks/myDrawer.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});
  static const route = "/taskScreen";
  final TextStyle _textStyle = const TextStyle(fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    log("Build the state");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                List<Task> allTasks = state.allTasks;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Chip(
                        label: Wrap(
                      children: [
                        const Text("My Task(s) "),
                        Text(
                          "${state.allTasks.length}",
                          style: const TextStyle(color: Colors.blue),
                        ),
                        const SizedBox(
                          width: 10,
                          child: Text(
                            " | ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Text("Completed Task(s) "),
                        Text(
                          "${state.completedTasks.length}",
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ],
                    )),
                    Expanded(
                      child: allTasks.isEmpty
                          ? const Center(
                              child: Text("No any tasks"),
                            )
                          : SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: MyTask(
                                  allTasks: allTasks, textStyle: _textStyle),
                            ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
      drawer: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return DrawerScreen(
            deletedTask: state.removedTasks,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return const AddTask();
                },
              )),
    );
  }
}
