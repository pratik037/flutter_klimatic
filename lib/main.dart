import 'package:flutter/material.dart';
import './ui/klimatic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Klimatic",
      debugShowCheckedModeBanner: false,
      home:klimatic(),
    );
  }
}

