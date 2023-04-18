import 'package:flutter/material.dart';
import 'package:todo/data/model/task.dart';
import 'package:todo/logic/bloc_exports.dart';
import 'package:todo/logic/swtich/switch_bloc.dart';
import 'package:todo/presentation/screens/authentication/login.dart';
import 'package:todo/presentation/screens/recycle/recycle_bin.dart';

class DrawerScreen extends StatefulWidget {
  List<Task> deletedTask = [];
  DrawerScreen({super.key, required this.deletedTask});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool themeMode = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black54,
                ),
                height: 60,
                width: double.infinity,
                child: Center(
                  child: Wrap(
                    children: const [
                      Icon(
                        Icons.settings,
                        size: 28,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Settings",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              // Recycle bin
              ListTile(
                onTap: () =>
                    Navigator.pushNamed(context, RecycleBinScreen.route),
                leading: const Icon(Icons.delete),
                title: const Text("Recycle Bin"),
                trailing: Text(widget.deletedTask.length.toString()),
              ),
              ListTile(
                onTap: () =>
                    Navigator.pushReplacementNamed(context, LoginScreen.route),
                leading: const Icon(Icons.logout),
                title: const Text("Log Out"),
              ),
              BlocBuilder<SwitchBloc, SwitchState>(
                builder: (context, state) {
                  return Switch(
                      value: state.toggleSwitch,
                      onChanged: (value) {
                        value
                            ? BlocProvider.of<SwitchBloc>(context)
                                .add(SwitchOnEvent())
                            : BlocProvider.of<SwitchBloc>(context)
                                .add(SwitchOffEvent());
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
