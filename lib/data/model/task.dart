import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final String description;
  bool? isDone;
  bool? isDeleted;
  bool? isFav;
  String? addDate;
  Task(
      {required this.title,
      required this.addDate,
      required this.description,
      this.isFav = false,
      this.isDone = false,
      this.isDeleted = false});

  Task copyWith(
      {String? title,
      String? addDate,
      String? description,
      bool? isFav,
      bool? isDone,
      bool? isDeleted}) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      isFav: isFav ?? this.isFav,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      addDate: addDate ?? this.addDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'addDate': addDate,
      'isFav': isFav,
      'isDone': isDone,
      'isDeleted': isDeleted
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      addDate: json['addDate'],
      description: json['description'],
      isFav: json['isFav'],
      isDone: json['isDone'],
      isDeleted: json['isDeleted'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [title, addDate, description, isFav, isDeleted, isDone];
}
