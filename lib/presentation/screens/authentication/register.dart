import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/data/model/user.dart';
import 'package:todo/presentation/screens/authentication/login.dart';
import 'package:todo/presentation/theme/mainTheme.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  static const route = "/registerScreen";
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  Future<int> _registerUser(String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        saveToFirebase(value);
      });
      return 1;
    } catch (e) {
      return 0;
    }
  }

  void saveToFirebase(UserCredential value) async {
    final fireStore = FirebaseFirestore.instance;
    UserData user = UserData();
    user.username = _usernameController.text;
    user.password = _passwordController.text;
    user.uid = value.user!.uid;
    await fireStore.collection('Users').doc(user.uid!).set(user.toJson());
  }

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
                              controller: _usernameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "*Required*";
                                } else if (!value.contains("@") &&
                                    !value.contains("gmail.com")) {
                                  return "*Bad Email Format*";
                                }
                                return null;
                              },
                              decoration: _username,
                            ),
                            AppTheme.verticalGap20,
                            TextFormField(
                              controller: _passwordController,
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
                                  onPressed: () async {
                                    if (_key.currentState!.validate()) {
                                      int status = await _registerUser(
                                          _usernameController.text,
                                          _passwordController.text);
                                      if (status > 0) {
                                        log("Register Success");
                                      } else {
                                        log("Register failed");
                                      }
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
