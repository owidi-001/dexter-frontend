import 'package:dexter/providers/auth_provider.dart';
import 'package:dexter/providers/product_provider.dart';
import 'package:dexter/widgets/bottomNavigationWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthenticationProvider.instance),
    ChangeNotifierProvider(create: (_) => ProductProvider.instance),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dexter app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavigationWidget(),
      // home: FutureBuilder(
      //   builder: ((context, snapshot) {
      //     if (snapshot.hasError) {
      //       return const Center(child: Text("There was an error loading data"));
      //     } else if (snapshot.hasData) {
      //       return BottomNavigationWidget();
      //     }
      //     return const Scaffold(
      //       body: Center(
      //         child: CircularProgressIndicator(),
      //       ),
      //     );
      //   }),
      // ),
    );
  }
}
