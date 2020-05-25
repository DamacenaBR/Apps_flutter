
import 'package:app_pizza/telas/tela_variados/tela_carrinho.dart';
import 'package:app_pizza/telas/tela_variados/tela_principal.dart';
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
       backgroundColor: Colors.blue,
       onTap: onTabTapped,
       currentIndex: _currentIndex,
       items: [
         BottomNavigationBarItem(
           icon: Icon(Icons.home, color: Colors.white),
           title: Text('Principal', style: TextStyle(color: Colors.white),),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.shopping_cart, color: Colors.white),
           title: Text('Carrinho', style: TextStyle(color: Colors.white),),
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

