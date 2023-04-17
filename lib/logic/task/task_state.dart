part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> allTasks;
  final List<Task> completedTasks;
  final List<Task> favouriteTasks;
  final List<Task> removedTasks;
  const TaskState({
    required this.allTasks,
    required this.completedTasks,
    required this.favouriteTasks,
    required this.removedTasks,
  });
  // const TaskState({this.allTasks = const <Task>[]});

  @override
  List<Object> get props =>
      [allTasks, completedTasks, favouriteTasks, removedTasks];

  Map<String, dynamic> toJson() {
    return {
      'allTasks': allTasks.map((e) => e.toJson()).toList(),
      'removedTasks': removedTasks.map((e) => e.toJson()).toList(),
      'completedTasks': completedTasks.map((e) => e.toJson()).toList(),
      'favouriteTasks': favouriteTasks.map((e) => e.toJson()).toList()
    };
  }

  factory TaskState.fromJson(Map<String, dynamic> json) {
    return TaskState(
        allTasks: List.from(json['allTasks'].map((e) => Task.fromJson(e))),
        completedTasks:
            List.from(json['completedTasks'].map((e) => Task.fromJson(e))),
        favouriteTasks:
            List.from(json['favouriteTasks'].map((e) => Task.fromJson(e))),
        removedTasks:
            List.from(json['removedTasks'].map((e) => Task.fromJson(e))));
  }
}

class TaskInitial extends TaskState {
  TaskInitial()
      : super(
          allTasks: [],
          removedTasks: [],
          completedTasks: [],
          favouriteTasks: [],
        );
}
