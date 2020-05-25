import 'package:app_web_servece_sd/rest_api.dart';
import 'package:flutter/material.dart';

class AddEstudentPage extends StatefulWidget {
  AddEstudentPage({Key key}) : super(key: key);

  _AddEstudentPageState createState() => _AddEstudentPageState();
}

class _AddEstudentPageState extends State<AddEstudentPage> {
  final _name = TextEditingController();
  final _rg = TextEditingController();
  final _grade = TextEditingController();
  final _user = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo empregado'),
      ),
      body: _body(),
    );
  }

  _body(){
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              /*TextField(
                controller: _name,
                decoration: InputDecoration(hintText: 'NAME'),
              ),
              TextField(
                controller: _rg,
                decoration: InputDecoration(hintText: 'RG'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _grade,
                decoration: InputDecoration(hintText: 'GRADE'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _user,
                decoration: InputDecoration(hintText: 'USER'),
              ),
              TextField(
                controller: _password,
                decoration: InputDecoration(hintText: 'PASSWORD'),
              ),
              */
              RaisedButton(
                child: Text(
                  'SAVE',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.purple,
                onPressed: () {
                  ApiService.makePostRequest().then((success) {
                    if (success) {
                      showDialog(
                        builder: (context) => AlertDialog(
                          title: Text('Successfully added!!!'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _user.text ='';
                                
                              },
                              child: Text('OK'),
                            )
                          ],
                        ),
                        context: context,
                      );
                      return;
                    } else {
                      showDialog(
                        builder: (context) => AlertDialog(
                          title: Text('Error Adding!!!'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            )
                          ],
                        ),
                        context: context,
                      );
                      return;
                    }
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}