import 'package:flutter/material.dart';
import 'package:todo/presentation/theme/mainTheme.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const route = "/loginScreen";

  final InputDecoration _username = InputDecoration(
      label: const Text("Username"),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(width: 1, color: Colors.blue)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(width: 1, color: Colors.blue)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(width: 1, color: Colors.red)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(width: 1, color: Colors.red)),
      contentPadding: const EdgeInsets.all(10));
  final InputDecoration _password = InputDecoration(
      label: const Text("Password"),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(width: 1, color: Colors.blue)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(width: 1, color: Colors.blue)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(width: 1, color: Colors.red)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(width: 1, color: Colors.red)),
      contentPadding: const EdgeInsets.all(10));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AppTheme.verticalGap50,
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.red,
                child: Container(
                  height: 70,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.red,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 0))
                      ],
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/logo.jpg"))),
                ),
              ),
              AppTheme.verticalGap50,
              TextFormField(
                decoration: _username,
              ),
              AppTheme.verticalGap20,
              TextFormField(
                decoration: _password,
              ),
              ElevatedButton(onPressed: () {}, child: const Text("LOGIN"))
            ],
          ),
        ),
      ),
    );
  }
}
