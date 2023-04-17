import 'package:flutter/material.dart';
import 'package:todo/data/model/task.dart';
import 'package:todo/presentation/screens/tasks/taskList.dart';
import 'package:todo/presentation/theme/mainTheme.dart';

class MyTask extends StatelessWidget {
  const MyTask({
    super.key,
    required this.allTasks,
    required TextStyle textStyle,
  }) : _textStyle = textStyle;

  final List<Task> allTasks;
  final TextStyle _textStyle;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      animationDuration: const Duration(milliseconds: 250),
      children: allTasks
          .map((task) => ExpansionPanelRadio(
                value: task.title,
                headerBuilder: (context, isExpanded) {
                  return TaskList(task: task);
                },
                body: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    8.0,
                    0.0,
                    8.0,
                    8.0,
                  ),
                  child: Column(
                    children: [
                      const Divider(),
                      Row(
                        children: [
                          Text(
                            "Note: ",
                            style: _textStyle,
                          ),
                          const Text("This is the detail section."),
                        ],
                      ),
                      const Divider(),
                      Center(
                          child: Text(
                        "Task",
                        style: _textStyle,
                      )),
                      AppTheme.verticalGap10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Task Name: ",
                          ),
                          Text(
                            task.title,
                            style: const TextStyle(color: Colors.blue),
                          ),
                          AppTheme.horizontalGap30,
                          const Text(
                            "Status: ",
                          ),
                          task.isDone!
                              ? const Text(
                                  "Completed",
                                  style: TextStyle(color: Colors.blue),
                                )
                              : const Text(
                                  "Pending",
                                  style: TextStyle(color: Colors.blue),
                                ),
                        ],
                      ),
                      const Divider(),
                      Center(
                        child: Text(
                          "Description",
                          style: _textStyle,
                        ),
                      ),
                      AppTheme.verticalGap10,
                      task.description.isEmpty
                          ? const Text("No description provided.")
                          : Text(
                              task.description,
                              style: const TextStyle(color: Colors.blue),
                            ),
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
