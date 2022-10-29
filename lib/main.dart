import 'package:dexter/providers/auth_provider.dart';
import 'package:dexter/providers/image_picker_provider.dart';
import 'package:dexter/providers/message_provider.dart';
import 'package:dexter/providers/product_provider.dart';
import 'package:dexter/widgets/bottomNavigationWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ImagePickerProvider()),
    ChangeNotifierProvider(create: (_) => AuthenticationProvider.instance),
    ChangeNotifierProvider(create: (_) => ProductProvider.instance),
    ChangeNotifierProvider(create: (_) => MessageProvider.instance),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dexter app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavigationWidget(),
    );
  }
}
