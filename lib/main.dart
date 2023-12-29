import 'package:flutter/material.dart';
import 'package:flutter_list2/pages/pages.dart';

import 'configs/configs.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: generateMaterialColor(Palette.primary),
      ),
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}
