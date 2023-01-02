import 'package:dexter/screens/auth/login.dart';
import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 44,
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                      "assets/icon/icon.png",
                    ),
                    radius: 48,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: const Text(
                      "Ready for business?",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    child: const Text(
                      "Elevate your management tasks and get notified on transactions.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: AppTheme.secondary),
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.5,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => LoginScreen())));
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          shape: const StadiumBorder(),
                          backgroundColor: AppTheme.secondary,
                        ),
                        child: const Text("Start working")),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
