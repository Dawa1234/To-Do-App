import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo/data/model/task.dart';
import 'package:todo/logic/task/task_bloc.dart';
import 'package:todo/logic/bloc_exports.dart';
import 'package:todo/presentation/screens/recycle/deletedTasks.dart';

class RecycleBinScreen extends StatelessWidget {
  const RecycleBinScreen({super.key});
  static const String route = "/bin";

  @override
  Widget build(BuildContext context) {
    log("build the recycle bin screen");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recycle Bin"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Chip(label: Text("Your Deleted Tasks")),
            const Divider(),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                List<Task> deletedTasks = state.removedTasks;
                return Expanded(
                  child: deletedTasks.isEmpty
                      ? Center(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: const [
                              Icon(Icons.delete_sweep),
                              Text("Empty")
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: deletedTasks.length,
                          itemBuilder: (context, index) {
                            Task task = deletedTasks[index];
                            return DeletedTasks(task: task);
                          },
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
