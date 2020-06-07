import 'package:curso_flutter/app6_preco_bitCoin/brasil.dart';

class BitCoin {
  BRL bRL;

  BitCoin({this.bRL});

  BitCoin.fromJson(Map<String, dynamic> json) {
    bRL = json['BRL'] != null ? new BRL.fromJson(json['BRL']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bRL != null) {
      data['BRL'] = this.bRL.toJson();
    }
    return data;
  }
}