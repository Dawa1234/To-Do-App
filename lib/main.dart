import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/logic/bloc_exports.dart';
import 'package:todo/myApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(const MyApp());
}
