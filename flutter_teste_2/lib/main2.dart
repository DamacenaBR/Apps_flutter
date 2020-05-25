import 'package:flutter/material.dart';
import 'package:flutter_teste_2/home.dart';

void main() {
  runApp(MaterialApp(
    /*home: Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.start,
        
        children: <Widget>[
          Icon(
            Icons.people,
            size: 150,
            color: Colors.blue[100],
          ),

          FlatButton(

            child: Text(
              "Clique 1",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),

            color: Colors.blue,
            onPressed: () {
              print("Clique 1 foi executado");
            },
          ),
          
          RaisedButton(

            child: Text(
              "Clique 2",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),

            onPressed: () {
              print("Clique 2");
            },
          ),
          
          Row(

            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[

              RaisedButton(
                
                child: Text(
                  "Clique 3",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                color: Colors.redAccent,
                onPressed: () {
                  print("Clique 3");
                },
              ),
              
              RaisedButton(

                child: Text(
                  "Clique 4",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),

                color: Colors.greenAccent,
                onPressed: () {
                  print("Clique 4");
                },
              ),
            ],
          ),
        ],
      ),
  ),


    debugShowCheckedModeBanner: false,
    home: Material(
      child: Stack(
        children: <Widget>[

          Container(
            height: 500,
            width: 300,
            color: Colors.yellowAccent,
          ),

          Container(
            height: 400,
            width: 200,
            color: Colors.greenAccent,
          ),

          Container(
            height: 300,
            width: 100,
            color: Colors.redAccent,
          ),
        ],
      ),
    ),*/

    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}