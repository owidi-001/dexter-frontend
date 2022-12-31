import 'package:dexter/models/auth_model.dart';
import 'package:dexter/providers/auth_provider.dart';
import 'package:dexter/screens/auth/welcome.dart';
import 'package:dexter/theme/theme.dart';
import 'package:dexter/utils/prefs.dart';
import 'package:dexter/widgets/bottomNavigationWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // late AppService _appService;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), initializeApp);
    // initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppTheme.primary,
      body: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(
            "assets/images/logo.png",
          ),
          radius: 48,
        ),
      ),
    );
  }

  Future<void> initializeApp() async {
    LoginData? data = await UserPreferences().loadUserData();

    if (!mounted) {
      return;
    }
    if (data == null) {
      // Go to welcome screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        ),
      );
    } else {
      context.read<AuthenticationProvider>().loginUser(
          user: data.user,
          authToken: data.authToken,
          isStaff: data.user.isStaff);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavigationWidget(),
        ),
      );
    }
  }
}
