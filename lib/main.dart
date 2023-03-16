import 'package:flutter/material.dart';
import 'package:flutter_week3_introduction_flutter_widget/flutter_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FlutterWidget(),
    );
  }
}
