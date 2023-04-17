import 'package:todo/data/model/task.dart';
import 'package:todo/logic/bloc_exports.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<AddTaskEvent>(_addTask);
    on<UpdateTaskEvent>(_updateTask);
    on<DeleteTaskEvent>(_deleteTask);
    on<RecoverTaskEvent>(_recoverTaskEvent);
    on<PermanentDeleteTaskEvent>(_permanentlyDeleteTask);
    on<AddToFavEvent>(_addToFav);
    on<EditTaskEvent>(_editTask);
  }

  _addTask(AddTaskEvent event, Emitter<TaskState> emit) {
    // get the present state
    final state = this.state;
    // add new task to the list
    List<Task> newTasks = List.from(state.allTasks)..add(event.task);

    // send/set new state
    emit(TaskState(
        allTasks: newTasks,
        completedTasks: state.completedTasks,
        favouriteTasks: state.favouriteTasks,
        removedTasks: state.removedTasks));
  }

  _updateTask(UpdateTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    final index = state.allTasks.indexOf(task);

    List<Task> allTasks = List.from(state.allTasks..remove(task));
    List<Task> completedTasks = List.from(state.completedTasks);
    List<Task> favouriteTasks = List.from(state.favouriteTasks);

// if the list is in the fav list then only update
    if (task.isFav!) {
      favouriteTasks.remove(task);
      if (task.isDone!) {
        favouriteTasks.add(task.copyWith(isDone: false));
      } else {
        favouriteTasks.add(task.copyWith(isDone: true));
      }
    }
    if (task.isDone!) {
      allTasks.insert(index, task.copyWith(isDone: false));
      completedTasks.remove(task);
    } else {
      allTasks.insert(index, task.copyWith(isDone: true));
      completedTasks.add(task.copyWith(isDone: true));
    }

    emit(TaskState(
        allTasks: allTasks,
        completedTasks: completedTasks,
        favouriteTasks: favouriteTasks,
        removedTasks: state.removedTasks));
  }

  _deleteTask(DeleteTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    List<Task> removedTasks = List.from(state.removedTasks)
      ..add(task.copyWith(
        isDone: false,
        isFav: false,
      ));
    List<Task> completedTasks = List.from(state.completedTasks)..remove(task);
    List<Task> favouriteTasks = List.from(state.favouriteTasks)..remove(task);

    emit(TaskState(
        allTasks: allTasks,
        completedTasks: completedTasks,
        favouriteTasks: favouriteTasks,
        removedTasks: removedTasks));
  }

  _permanentlyDeleteTask(
      PermanentDeleteTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    List<Task> removedTasks = List.from(state.removedTasks)..remove(task);

    emit(TaskState(
        allTasks: state.allTasks,
        completedTasks: state.completedTasks,
        favouriteTasks: state.favouriteTasks,
        removedTasks: removedTasks));
  }

  _recoverTaskEvent(event, emit) {
    final state = this.state;
    final task = event.task;

    List<Task> allTasks = List.from(state.allTasks)..add(task);
    List<Task> removedTasks = List.from(state.removedTasks)..remove(task);

    emit(TaskState(
        allTasks: allTasks,
        completedTasks: state.completedTasks,
        favouriteTasks: state.favouriteTasks,
        removedTasks: removedTasks));
  }

  _addToFav(AddToFavEvent event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    final int index = state.allTasks.indexOf(task);

    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    List<Task> completedTasks = List.from(state.completedTasks);
    List<Task> favTasks = List.from(state.favouriteTasks);

    if (task.isDone!) {
      if (task.isFav!) {
        completedTasks.remove(task);
        completedTasks.add(task.copyWith(isFav: false));
      } else {
        completedTasks.remove(task);
        completedTasks.add(task.copyWith(isFav: true));
      }
    }

    if (task.isFav!) {
      favTasks.remove(task);
      allTasks.insert(index, task.copyWith(isFav: false));
    } else {
      favTasks.add(task.copyWith(isFav: true));
      allTasks.insert(index, task.copyWith(isFav: true));
    }

    emit(TaskState(
        allTasks: allTasks,
        completedTasks: completedTasks,
        favouriteTasks: favTasks,
        removedTasks: state.removedTasks));
  }

  _editTask(EditTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;
    final int index = state.allTasks.indexOf(event.oldTask);
    List<Task> allTasks = List.from(state.allTasks)..remove(event.oldTask);

    allTasks.insert(index, event.newTask);

    emit(TaskState(
        allTasks: allTasks,
        completedTasks: state.completedTasks,
        favouriteTasks: state.favouriteTasks,
        removedTasks: state.removedTasks));
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toJson();
  }
}
