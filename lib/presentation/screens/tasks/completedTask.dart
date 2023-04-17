import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo/data/model/task.dart';
import 'package:todo/logic/task/task_bloc.dart';
import 'package:todo/logic/bloc_exports.dart';
import 'package:todo/presentation/screens/tasks/taskList.dart';

class CompletedTaskScreen extends StatelessWidget {
  const CompletedTaskScreen({super.key});
  static const route = "/completedTaskScreen";

  @override
  Widget build(BuildContext context) {
    log("Build the state");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Completed Tasks"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                List<Task> allTasks = state.completedTasks;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Chip(
                        label: Wrap(
                      children: [
                        const Text("Completed Task(s) "),
                        Text(
                          "${allTasks.length}",
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ],
                    )),
                    Expanded(
                        child: allTasks.isEmpty
                            ? const Center(
                                child: Text("No any completed tasks."),
                              )
                            : ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: allTasks.length,
                                itemBuilder: (context, index) {
                                  Task task = allTasks[index];
                                  return TaskList(task: task);
                                },
                              )),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
