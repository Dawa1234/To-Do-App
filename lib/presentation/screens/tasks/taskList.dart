import 'package:flutter/material.dart';
import 'package:todo/data/model/task.dart';
import 'package:todo/logic/task/task_bloc.dart';
import 'package:todo/logic/bloc_exports.dart';
import 'package:todo/presentation/screens/tasks/editTask.dart';
import 'package:todo/presentation/theme/mainTheme.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.task,
  });
  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          BlocProvider.of<TaskBloc>(context).add(AddToFavEvent(task: task));
        },
        icon: task.isFav!
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
      ),
      title: Text(
        task.title,
        style: TextStyle(
            decoration: task.isDone!
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      subtitle: Text(
          "Date: ${task.addDate!.split(' ')[0]} Time: ${task.addDate!.split(' ')[1]}"),
      trailing: Wrap(
        children: [
          SizedBox(
            width: 20,
            child: Checkbox(
                value: task.isDone,
                onChanged: (value) {
                  context.read<TaskBloc>().add(UpdateTaskEvent(task: task));
                }),
          ),
          AppTheme.horizontalGap10,
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                  onTap: () {
                    BlocProvider.of<TaskBloc>(context)
                        .add(DeleteTaskEvent(task: task));
                  },
                  child: TextButton.icon(
                      onPressed: () {
                        BlocProvider.of<TaskBloc>(context)
                            .add(DeleteTaskEvent(task: task));
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.delete),
                      label: const Text("Move to bin"))),
              PopupMenuItem(
                  child: TextButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return EditTask(
                              currentTask: task,
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.edit),
                      label: const Text("Edit"))),
            ],
          ),
        ],
      ),
    );
  }
}
