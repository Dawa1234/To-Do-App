import 'package:flutter/material.dart';
import 'package:todo/data/model/task.dart';
import 'package:todo/logic/task/task_bloc.dart';
import 'package:todo/logic/bloc_exports.dart';

class DeletedTasks extends StatelessWidget {
  const DeletedTasks({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.file_present_sharp),
      title: Text(task.title),
      trailing: Wrap(
        children: [
          IconButton(
            icon: const Icon(size: 20, Icons.delete),
            onPressed: () {
              BlocProvider.of<TaskBloc>(context)
                  .add(PermanentDeleteTaskEvent(task: task));
            },
          ),
          IconButton(
            icon: const Icon(size: 20, Icons.restore_sharp),
            onPressed: () {
              BlocProvider.of<TaskBloc>(context)
                  .add(RecoverTaskEvent(task: task));
            },
          ),
        ],
      ),
    );
  }
}
