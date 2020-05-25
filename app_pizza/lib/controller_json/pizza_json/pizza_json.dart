import 'package:app_pizza/model/bebidas.dart';
import 'package:app_pizza/model/pizza.dart';

class PizzaJson {
  String categoria;
  List<Pizza> pizzas;

  PizzaJson({this.categoria, this.pizzas});

  PizzaJson.fromJson(Map<dynamic, dynamic> json) {
    categoria = json['categoria'];

    var list = json['pizzas'] as List;
    List<Pizza> pizzasList = list.map((i) => Pizza.fromJson(i)).toList();

    pizzas = pizzasList;
  }

  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> json = Map<dynamic, dynamic>();
    json['categoria'] = categoria;
    json['pizzas'] = pizzas;

    return json;
  }

  @override
  String toString() {
    return "Nome: $categoria => Pizza: $pizzas";
  }
}
