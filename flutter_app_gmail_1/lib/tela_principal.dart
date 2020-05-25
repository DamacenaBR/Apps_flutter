import 'package:flutter/material.dart';
import 'package:flutter_app_gmail_1/escrever.dart';

class Telaprincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Principal"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: _drawer(),
      body: _list(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.edit),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => EscreverEmail()));          
        },
      ),
    );
  }
}

_drawer() {
  return Drawer(
      child: SingleChildScrollView(
    child: Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            child: Text("B"),
          ),
          accountEmail: Text("bruno23cz@gmail.com"),
          accountName: Text("Bruno"),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.inbox),
              trailing: Text("37"),
              title: Text("Principal"),
            ),
            ListTile(
              leading: Icon(Icons.supervisor_account),
              trailing: Container(
                height: 25,
                child: RaisedButton(
                  child: Text("1 novas"),
                  color: Colors.blue,
                  onPressed: () {},
                ),
              ),
              title: Text("Principal"),
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text("Promoções"),
              trailing: Container(
                height: 25,
                child: RaisedButton(
                  child: Text("1 novas"),
                  color: Colors.green,
                  onPressed: () {},
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text(
                "Todos os marcadores",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Com estrelas"),
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text("Adiados"),
            ),
            ListTile(
              leading: Icon(Icons.label_important),
              title: Text("Importante"),
              trailing: Text("71"),
            ),
            ListTile(
              leading: Icon(Icons.send),
              title: Text("Enviados"),
            ),
            ListTile(
              leading: Icon(Icons.input),
              title: Text("Caixa de entrada"),
            ),
          ],
        ),
      ],
    ),
  ));
}

_list() {
  return ListView(
    children: <Widget>[
      ListTile(
          leading: CircleAvatar(
            child: Text("M"),
            backgroundColor: Colors.green,
          ),
          title: Text("Mercado Livre"),
          subtitle: Text("Venda realizada com sucesso"),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "6 de set",
                style: TextStyle(color: Colors.grey),
              ),
              Icon(Icons.star_border),
            ],
          )),
      ListTile(
          leading: CircleAvatar(
            child: Text("M"),
            backgroundColor: Colors.green,
          ),
          title: Text("Mercado Livre"),
          subtitle: Text("Venda realizada com sucesso"),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "5 de set",
                style: TextStyle(color: Colors.grey),
              ),
              Icon(Icons.star_border),
            ],
          )),
      ListTile(
          leading: CircleAvatar(
            child: Text("M"),
            backgroundColor: Colors.green,
          ),
          title: Text("Mercado Livre"),
          subtitle: Text("Venda realizada com sucesso"),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "5 de set",
                style: TextStyle(color: Colors.grey),
              ),
              Icon(Icons.star_border),
            ],
          )),
      ListTile(
          leading: CircleAvatar(
            child: Text("M"),
            backgroundColor: Colors.green,
          ),
          title: Text("Mercado Livre"),
          subtitle: Text("Venda realizada com sucesso"),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "5 de set",
                style: TextStyle(color: Colors.grey),
              ),
              Icon(Icons.star_border),
            ],
          )),
      ListTile(
          leading: CircleAvatar(
            child: Text("M"),
            backgroundColor: Colors.green,
          ),
          title: Text("Mercado Livre"),
          subtitle: Text("Venda realizada com sucesso"),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "4 de set",
                style: TextStyle(color: Colors.grey),
              ),
              Icon(Icons.star_border),
            ],
          )),
      ListTile(
          leading: CircleAvatar(
            child: Text("M"),
            backgroundColor: Colors.green,
          ),
          title: Text("Mercado Livre"),
          subtitle: Text("Venda realizada com sucesso"),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "4 de set",
                style: TextStyle(color: Colors.grey),
              ),
              Icon(Icons.star_border),
            ],
          )),
      ListTile(
          leading: CircleAvatar(
            child: Text("M"),
            backgroundColor: Colors.green,
          ),
          title: Text("Mercado Livre"),
          subtitle: Text("Venda realizada com sucesso"),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "3 de set",
                style: TextStyle(color: Colors.grey),
              ),
              Icon(Icons.star_border),
            ],
          )),
      ListTile(
          leading: CircleAvatar(
            child: Text("M"),
            backgroundColor: Colors.green,
          ),
          title: Text("Mercado Livre"),
          subtitle: Text("Venda realizada com sucesso"),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "3 de set",
                style: TextStyle(color: Colors.grey),
              ),
              Icon(Icons.star_border),
            ],
          )),
      ListTile(
          leading: CircleAvatar(
            child: Text("M"),
            backgroundColor: Colors.green,
          ),
          title: Text("Mercado Livre"),
          subtitle: Text("Venda realizada com sucesso"),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "3 de set",
                style: TextStyle(color: Colors.grey),
              ),
              Icon(Icons.star_border),
            ],
          )),
    ],
  );
}
