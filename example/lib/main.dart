import 'package:flutter/material.dart';
import 'smoke_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floating Tabbar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        canvasColor: Colors.grey[50],
      ),
      /* Check whole example folder in the package which has smoke test for each widget */
      home: const SmokeTest(),
    );
  }
}
