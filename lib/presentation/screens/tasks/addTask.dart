import 'package:flutter/material.dart';
import 'package:todo/data/model/task.dart';
import 'package:todo/logic/task/task_bloc.dart';
import 'package:todo/logic/bloc_exports.dart';
import 'package:todo/presentation/theme/mainTheme.dart';

class AddTask extends StatefulWidget {
  const AddTask({
    super.key,
  });
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _taskController = TextEditingController();
  final _descriptionController = TextEditingController();
  String currentDateTime = "";
  final _key = GlobalKey<FormState>();
  final List<String> _titles = [];
  void _currentDateTime() {
    currentDateTime =
        "${DateTime.now().toString().split(' ')[0]} ${DateTime.now().toString().split(' ')[1].split(":")[0]}:${DateTime.now().toString().split(' ')[1].split(":")[1]}";
  }

  void _getTitles() {
    final allTasks = BlocProvider.of<TaskBloc>(context).state.allTasks;
    for (Task data in allTasks) {
      _titles.add(data.title);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getTitles();
    _currentDateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Add Task",
                  style: TextStyle(fontSize: 24),
                ),
                TextFormField(
                  controller: _taskController,
                  autofocus: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*Required*";
                    } else if (_titles.contains(value)) {
                      return "*Task already assigned*";
                    }
                    return null;
                  },
                  decoration:
                      AppTheme.inputDecoration(label: const Text("Task")),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: AppTheme.inputDecoration(
                      label: const Text("Description")),
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Camera
                    ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                      label: const Text('Cancel'),
                    ),
                    // Gallery
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          context.read<TaskBloc>().add(AddTaskEvent(
                              task: Task(
                                  title: _taskController.text,
                                  description: _descriptionController.text,
                                  addDate: currentDateTime)));
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Add Task'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
