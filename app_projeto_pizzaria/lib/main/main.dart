import 'package:app_projeto_pizzaria/provider/controller_provider.dart';
import 'package:app_projeto_pizzaria/telas/tela_variados/tela_splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: <SingleChildCloneableWidget>[
          ChangeNotifierProvider<IncrementeProvider>.value(
              value: IncrementeProvider()),                       
        ],
        child: MaterialApp(
          home: TelaSplash(),
          debugShowCheckedModeBanner: false,
        ));
  }
}