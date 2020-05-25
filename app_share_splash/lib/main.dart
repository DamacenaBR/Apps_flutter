import 'package:app_share_splash/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplasPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
