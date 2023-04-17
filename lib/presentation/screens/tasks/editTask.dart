import 'package:flutter/material.dart';
import 'package:todo/data/model/task.dart';
import 'package:todo/logic/task/task_bloc.dart';
import 'package:todo/logic/bloc_exports.dart';
import 'package:todo/presentation/theme/mainTheme.dart';

class EditTask extends StatefulWidget {
  final Task currentTask;
  const EditTask({
    required this.currentTask,
    super.key,
  });
  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final _taskController = TextEditingController();
  final _descriptionController = TextEditingController();
  String currentDateTime = "";
  final _key = GlobalKey<FormState>();
  final List<String> _titles = [];

  void _currentDateTime() {
    currentDateTime =
        "${DateTime.now().toString().split(' ')[0]} ${DateTime.now().toString().split(' ')[1].split(":")[0]}:${DateTime.now().toString().split(' ')[1].split(":")[1]}";
  }

  void _initalData() {
    _taskController.text = widget.currentTask.title;
    _descriptionController.text = widget.currentTask.description;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initalData();
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
                  "Edit Task",
                  style: TextStyle(fontSize: 24),
                ),
                TextFormField(
                  controller: _taskController,
                  autofocus: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*Required*";
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
                          context.read<TaskBloc>().add(EditTaskEvent(
                              oldTask: widget.currentTask,
                              newTask: Task(
                                  title: _taskController.text,
                                  description: _descriptionController.text,
                                  addDate: currentDateTime)));
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.edit),
                      label: const Text('Save edit'),
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
