
import 'package:app_projeto_pizzaria/telas/tela_variados/tela_carrinho.dart';
import 'package:app_projeto_pizzaria/telas/tela_variados/tela_principal.dart';
import 'package:flutter/material.dart';

class TelaControllerPrincipal extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<TelaControllerPrincipal> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    TelaPrincipal(),
    TelaCarrinho(),
  ];

@override
 Widget build(BuildContext context) {
   return Scaffold(
     body: _children[_currentIndex],
     bottomNavigationBar: BottomNavigationBar(
       backgroundColor: Colors.white,
       onTap: onTabTapped,
       selectedItemColor: Colors.blue,
       currentIndex: _currentIndex,
       items: [
         BottomNavigationBarItem(
           icon: Icon(Icons.home, size: 25,),
           title: Text('Principal'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.shopping_cart, size: 25,),
           title: Text('Carrinho'),
         )
       ],
     ),
   );
 }

void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }

}

