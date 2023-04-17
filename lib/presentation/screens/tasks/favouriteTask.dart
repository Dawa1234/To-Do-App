import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo/data/model/task.dart';
import 'package:todo/logic/task/task_bloc.dart';
import 'package:todo/logic/bloc_exports.dart';
import 'package:todo/presentation/screens/tasks/taskList.dart';

class FavouriteTaskScreen extends StatelessWidget {
  const FavouriteTaskScreen({super.key});
  static const route = "/favouriteTaskScreen";

  @override
  Widget build(BuildContext context) {
    log("Build the state");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Tasks"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                List<Task> favTasks = state.favouriteTasks;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Chip(
                        label: Wrap(
                      children: [
                        const Text("Favourite Task(s) "),
                        Text(
                          "${favTasks.length}",
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ],
                    )),
                    Expanded(
                        child: favTasks.isEmpty
                            ? const Center(
                                child: Text("No any favourite tasks."),
                              )
                            : ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: favTasks.length,
                                itemBuilder: (context, index) {
                                  Task task = favTasks[index];
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
