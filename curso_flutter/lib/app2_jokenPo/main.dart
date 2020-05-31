
import 'package:curso_flutter/app2_jokenPo/home.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JokenPo",
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}