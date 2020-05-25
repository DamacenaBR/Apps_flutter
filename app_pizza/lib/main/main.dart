import 'package:app_pizza/controller_model/provider/empresa_provider.dart';
import 'package:app_pizza/controller_model/provider/mesa_provider.dart';
import 'package:app_pizza/telas/tela_variados/tela_splash.dart';
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
          ChangeNotifierProvider<IncrementeCarrinho>.value(
              value: IncrementeCarrinho()),
              ChangeNotifierProvider<IncrementeEmpresa>.value(
              value: IncrementeEmpresa()),
        ],
        child: MaterialApp(
          home: TelaSplash(),
          debugShowCheckedModeBanner: false,
        ));
  }
}