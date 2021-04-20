import 'package:flutter/material.dart';
import 'package:hive/pages/HomePageSr.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuzzClip',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        accentColor: Colors.red[300],
        cardColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
