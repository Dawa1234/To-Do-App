// ignore: file_names
import 'package:flutter/material.dart';
import 'package:todo/logic/loading/loading_bloc.dart';
import 'package:todo/logic/swtich/switch_bloc.dart';
import 'package:todo/logic/task/task_bloc.dart';
import 'package:todo/logic/bloc_exports.dart';
import 'package:todo/presentation/router/appRoutes.dart';
import 'package:todo/presentation/screens/splashScreen.dart';
import 'package:todo/presentation/theme/mainTheme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => LoadingBloc()),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.toggleSwitch
                ? AppTheme.darkThemeData
                : AppTheme.lightThemeData,
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.route,
            routes: AppRouter.getRoutes,
          );
        },
      ),
    );
  }
}
