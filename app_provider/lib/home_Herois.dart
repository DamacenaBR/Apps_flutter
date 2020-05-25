import 'package:app_provider/herois.dart';
import 'package:app_provider/incremente_provider_herois.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeIncrementeHerois extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Consumer<IncrementeHerois>(
            builder: (context, incrementeHerois, child) {
              return Text(
                  '${incrementeHerois.listHerois.where((h) => h.eFavorito).length}');
            },
          ),
        ),
        body: Consumer<IncrementeHerois>(
            builder: (context, heroisProvedor, child) {
          return _listView(heroisProvedor);
        }));
  }

  _listView(IncrementeHerois heroisProvedor) {
    return ListView.builder(
        itemCount: heroisProvedor.listHerois.length,
        itemBuilder: (context, index) {
          return _itemList(context, heroisProvedor.listHerois[index]);
        });
  }

  _itemList(BuildContext context, HeroisModel heroisModel) {
    return ListTile(
      onTap: (){
        Provider.of<IncrementeHerois>(context).checkHerois(heroisModel);
      },
        title: Text(heroisModel.nome),
        trailing: heroisModel.eFavorito
            ? Icon(
                Icons.star,
                color: Colors.yellow,
                size: 35,
              )
            : Icon(Icons.star_border));
  }
}
