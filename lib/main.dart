import 'package:dexter/providers/image_picker_provider.dart';
import 'package:dexter/widgets/bottomNavigationWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ImagePickerProvider()),
    ],
    child: const MyApp()));
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