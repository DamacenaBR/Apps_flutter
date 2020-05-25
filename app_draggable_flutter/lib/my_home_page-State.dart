import 'package:app_draggable_flutter/my_homePage.dart';
import 'package:draggable_flutter_list/draggable_flutter_list.dart';
import 'package:flutter/material.dart';


//A MyHomePageState armazena os dados mutáveis ​​que podem mudar ao longo da vida útil do widget. 
class MyHomePageState extends State<MyHomePage> {
  List<String> items = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("draggable_flutter"),
      ),
      body: _body(context),
    );
  }
  
  _body(BuildContext context){
    return DragAndDropList(
        items.length,
        itemBuilder: (context, index) {
          
          return Container(       
            child:  Card(
              child: ListTile(
                title: Text(items[index]),
              ),
            ),
          );
        },
        
        onDragFinish: (int antes,int depois) {
          print('final do arrasto $antes a $depois');
          String data = items[antes];
          items.removeAt(antes);
         items.insert(depois, data);
        },
        
        canDrag: (index) {
          return index % 2!= 1;
        },
        
        canBeDraggedTo: (int one, int two){
          return two!= 0;
        },
        
        dragElevation: 90,
      );
  }
}