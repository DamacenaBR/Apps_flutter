import 'package:app_grid_button/menu_principal.dart';
import 'package:app_grid_button/menu_principal_statefull.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuPrincipal(),
      //home: MenuPrincipal1(),
      debugShowCheckedModeBanner: false,
    );
  }
}