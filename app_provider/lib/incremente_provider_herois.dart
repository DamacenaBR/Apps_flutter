import 'package:app_provider/herois.dart';
import 'package:flutter/foundation.dart';


class IncrementeHerois extends ChangeNotifier{
  List<HeroisModel> listHerois = [
    HeroisModel(nome: 'Homem de Ferro'),
    HeroisModel(nome: 'Home Aranha'),
    HeroisModel(nome: 'Viuva Negra'),
    HeroisModel(nome: 'Pantera Negra'),
    HeroisModel(nome: 'Gamona'),
  ];

  void checkHerois(HeroisModel heroisModel){
    heroisModel.eFavorito = !heroisModel.eFavorito;
    notifyListeners();
  }

}