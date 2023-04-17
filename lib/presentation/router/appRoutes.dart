// ignore: file_names
import 'package:flutter/material.dart';
import 'package:todo/presentation/screens/recycle/recycle_bin.dart';
import 'package:todo/presentation/screens/tasks/taskScreen.dart';
import 'package:todo/presentation/screens/tasks/taskTabs.dart';

class AppRouter {
  static Map<String, WidgetBuilder> getRoutes = <String, WidgetBuilder>{
    TaskScreen.route: (context) => TaskScreen(),
    RecycleBinScreen.route: (context) => const RecycleBinScreen(),
    TaskTabScreen.route: (context) => const TaskTabScreen(),
  };
}
