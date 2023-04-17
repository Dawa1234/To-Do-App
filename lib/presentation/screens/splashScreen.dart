import 'package:flutter/material.dart';
import 'package:todo/presentation/screens/authentication/login.dart';
import 'package:todo/presentation/theme/mainTheme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const route = "/splashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigateTo(String path) async {
    await Future.delayed(const Duration(seconds: 2)).whenComplete(() {
      Navigator.pushReplacementNamed(context, path);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateTo(LoginScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
            AppTheme.verticalGap10,
            const Text(
              "Digital Wallet (Nepal)",
              style: TextStyle(color: Colors.black54, fontSize: 12),
            ),
            AppTheme.verticalGap10,
            const Text(
              "Pay Nep Private Limited (PNPL)",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 115, 115), fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
