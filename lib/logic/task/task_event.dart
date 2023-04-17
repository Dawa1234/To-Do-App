part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class AddTaskEvent extends TaskEvent {
  Task task;
  AddTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}

// ignore: must_be_immutable
class UpdateTaskEvent extends TaskEvent {
  Task task;
  UpdateTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}

// ignore: must_be_immutable
class DeleteTaskEvent extends TaskEvent {
  Task task;
  DeleteTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}

// ignore: must_be_immutable
class RecoverTaskEvent extends TaskEvent {
  Task task;
  RecoverTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}

// ignore: must_be_immutable
class AddToFavEvent extends TaskEvent {
  Task task;
  AddToFavEvent({required this.task});

  @override
  List<Object> get props => [task];
}

// ignore: must_be_immutable
class PermanentDeleteTaskEvent extends TaskEvent {
  Task task;
  PermanentDeleteTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}

// ignore: must_be_immutable
class EditTaskEvent extends TaskEvent {
  Task oldTask;
  Task newTask;
  EditTaskEvent({
    required this.oldTask,
    required this.newTask,
  });

  @override
  List<Object> get props => [oldTask, newTask];
}
