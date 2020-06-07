import 'package:curso_flutter/app6_preco_bitCoin/concumo_servico.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(), //WebService-Bit_Coin
      debugShowCheckedModeBanner: false,
    );
  }
}