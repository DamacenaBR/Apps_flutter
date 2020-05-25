import 'package:flutter/material.dart';
 class ExemploDefaultTabBarController extends StatelessWidget {

   List<Widget> _listWidgets

   @override
   Widget build(BuildContext context) {
     return DefaultTabController(
       length: 3,
       child: Scaffold(
         appBar: AppBar(
           bottom: TabBar(
             tabs: <Widget>[
               Tab(icon: Icon(Icon.add),),
               Tab(icon: Icon(Icon.edit),),
               Tab(icon: Icon(Icon.delete),),
             ],
           ),
         ),
         body: TabBarView(
           physics: NeverScrollableScrollPhysics(),
           children:
         )
       )
     );
   }
 }