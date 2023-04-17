import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:todo/presentation/screens/authentication/login.dart';
import 'package:todo/presentation/theme/mainTheme.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  static const route = "/registerScreen";
  final _key = GlobalKey<FormState>();

  final InputDecoration _username = InputDecoration(
      prefixIcon: const Icon(Icons.person),
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
      prefixIcon: const Icon(Icons.lock),
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
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: Colors.black45,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 250,
                      child: Container(
                        height: 70,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(255, 255, 116, 106),
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
                    Row(
                      children: const [
                        SizedBox(
                          width: 110,
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                        AppTheme.horizontalGap10,
                        Text(
                          "NEW CREDINTIALS",
                          style: TextStyle(color: Colors.black54),
                        ),
                        AppTheme.horizontalGap10,
                        SizedBox(
                          width: 110,
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    AppTheme.verticalGap10,
                    SizedBox(
                        height: 300,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "*Required*";
                                }
                                return null;
                              },
                              decoration: _username,
                            ),
                            AppTheme.verticalGap20,
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "*Required*";
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: _password,
                            ),
                            AppTheme.verticalGap30,
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_key.currentState!.validate()) {
                                      log("Login");
                                    }
                                  },
                                  child: const Text(
                                    "REGISTER",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )),
                            ),
                            AppTheme.verticalGap20,
                            GestureDetector(
                              onTap: () => Navigator.pushReplacementNamed(
                                  context, LoginScreen.route),
                              child: const Text(
                                "Already have an account?",
                                style: TextStyle(
                                    color: Colors.transparent,
                                    shadows: [
                                      Shadow(
                                          color: Colors.black,
                                          offset: Offset(0, -5))
                                    ],
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.black54),
                              ),
                            ),
                          ],
                        )),
                    const Center(
                      child: Text(
                        "Pay Nep Private Limited (PNPL)",
                        style: TextStyle(color: Colors.black45),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
