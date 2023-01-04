import 'package:dexter/providers/auth_provider.dart';
import 'package:dexter/providers/cart_provider.dart';
import 'package:dexter/providers/notifications_provider.dart';
import 'package:dexter/providers/product_provider.dart';
import 'package:dexter/screens/auth/splash.dart';
import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthenticationProvider.instance),
    ChangeNotifierProvider(create: (_) => ProductProvider()),
    ChangeNotifierProvider(create: (_) => CartProvider()),
    ChangeNotifierProvider(create: (_) => NotificationsProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dexter app',
      theme: ThemeData(
        primaryColor: AppTheme.secondary,
      ),
      home: const SplashScreen(),
    );
  }
}
