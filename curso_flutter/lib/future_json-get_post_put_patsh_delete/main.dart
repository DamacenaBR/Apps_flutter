import 'package:curso_flutter/future_json-get_post_put_patsh_delete/home.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(), //Future
      debugShowCheckedModeBanner: false,
    );
  }
}