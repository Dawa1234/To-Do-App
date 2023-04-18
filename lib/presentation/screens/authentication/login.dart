import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/logic/bloc_exports.dart';
import 'package:todo/logic/loading/loading_bloc.dart';
import 'package:todo/presentation/screens/authentication/register.dart';
import 'package:todo/presentation/screens/tasks/taskTabs.dart';
import 'package:todo/presentation/theme/mainTheme.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const route = "/loginScreen";
  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  Future<int> login(BuildContext context, String email, String password) async {
    int status = 0;
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        if (value.user != null) {
          status = 1;
        }
      });
      return status;
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return 0;
    }
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    AppTheme.verticalGap50,
                    SizedBox(
                      width: double.infinity,
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
                          width: 105,
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                        AppTheme.horizontalGap10,
                        Text(
                          "LOGIN CREDINTIALS",
                          style: TextStyle(color: Colors.black54),
                        ),
                        AppTheme.horizontalGap10,
                        SizedBox(
                          width: 105,
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    AppTheme.verticalGap10,
                    SizedBox(
                        height: 320,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
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
                              child: ElevatedButton(onPressed: () async {
                                if (_key.currentState!.validate()) {
                                  BlocProvider.of<LoadingBloc>(context)
                                      .add(ShowLoading());
                                  await login(context, _emailController.text,
                                          _passwordController.text)
                                      .then((value) {
                                    if (value > 0) {
                                      BlocProvider.of<LoadingBloc>(context)
                                          .add(HideLoading());
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                              TaskTabScreen.route);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              backgroundColor: Colors.green,
                                              duration: Duration(seconds: 2),
                                              content: Text("Logged In")));
                                      return;
                                    }
                                    BlocProvider.of<LoadingBloc>(context)
                                        .add(HideLoading());
                                  });
                                }
                              }, child: BlocBuilder<LoadingBloc, LoadingState>(
                                builder: (context, state) {
                                  return Wrap(
                                    children: [
                                      const Text(
                                        "LOGIN",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      AppTheme.horizontalGap10,
                                      state.isLoading
                                          ? const SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 2,
                                              ),
                                            )
                                          : const Text("")
                                    ],
                                  );
                                },
                              )),
                            ),
                            AppTheme.verticalGap20,
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, RegisterScreen.route),
                              child: const Text(
                                "Create an account",
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
