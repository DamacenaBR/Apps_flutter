import 'package:app_carrinho_compra/tela_principal.dart';
import 'package:app_carrinho_compra/produto_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: <SingleChildCloneableWidget>[
          ChangeNotifierProvider<IncrementeProduto>.value(
              value: IncrementeProduto()),
        ],
        child: MaterialApp(
          home: TelaPrincipal(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
