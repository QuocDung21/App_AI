// main.dart

import 'package:flutter/material.dart';
import 'pages/Disease.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thông tin bệnh cây lúa',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DiseaseScreen(disease: diseaseSample),
    );
  }
}
