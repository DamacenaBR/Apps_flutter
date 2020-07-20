import 'package:curso_flutter/tab_bar_abas/home.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(), //Tab_Bar
      debugShowCheckedModeBanner: false,
    );
  }
}
