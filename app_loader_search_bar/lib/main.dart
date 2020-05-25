import 'package:app_loader_search_bar/loader_search_bar_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(TestApp());

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoaderSearchBarPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

