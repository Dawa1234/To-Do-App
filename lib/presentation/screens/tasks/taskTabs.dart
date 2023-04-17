import 'package:flutter/material.dart';
import 'package:todo/presentation/screens/tasks/completedTask.dart';
import 'package:todo/presentation/screens/tasks/favouriteTask.dart';
import 'package:todo/presentation/screens/tasks/taskScreen.dart';

class TaskTabScreen extends StatefulWidget {
  const TaskTabScreen({super.key});
  static const route = "/taskTabScreen";

  @override
  State<TaskTabScreen> createState() => _TaskTabScreenState();
}

class _TaskTabScreenState extends State<TaskTabScreen> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    List pages = [
      const TaskScreen(),
      const CompletedTaskScreen(),
      const FavouriteTaskScreen(),
    ];
    return Scaffold(
      body: pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _currentPage = value;
            });
          },
          currentIndex: _currentPage,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
                label: "All Tasks", icon: Icon(Icons.folder)),
            BottomNavigationBarItem(
                label: "Completed Tasks", icon: Icon(Icons.done_all)),
            BottomNavigationBarItem(
                label: "Favourite Tasks", icon: Icon(Icons.favorite)),
          ]),
    );
  }
}
