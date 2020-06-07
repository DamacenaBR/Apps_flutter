import 'package:curso_flutter/webservice-bloc_api/concumo_servico.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(), //WebService
      debugShowCheckedModeBanner: false,
    );
  }
}