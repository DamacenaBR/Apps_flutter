import 'package:app_pizza/telas/tela_bebidas/tela_principal_bebidas.dart';
import 'package:app_pizza/telas/tela_variados/tela_carrinho.dart';
import 'package:flutter/material.dart';

class TelaControllerBebidas extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<TelaControllerBebidas> {
  int _currentIndex = 0;
  final List<Widget> _children = [  
    TelaPrincipalBebidas(),
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
           icon: Icon(Icons.local_drink, color: Colors.white),
           title: Text('Bebidas', style: TextStyle(color: Colors.white),),
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

