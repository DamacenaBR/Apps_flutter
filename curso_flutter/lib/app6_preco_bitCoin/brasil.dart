class BRL {
  double d15m;
  double last;
  double buy;
  double sell;
  String symbol;

  BRL({this.d15m, this.last, this.buy, this.sell, this.symbol});

  BRL.fromJson(Map<String, dynamic> json) {
    d15m = json['15m'];
    last = json['last'];
    buy = json['buy'];
    sell = json['sell'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['15m'] = this.d15m;
    data['last'] = this.last;
    data['buy'] = this.buy;
    data['sell'] = this.sell;
    data['symbol'] = this.symbol;
    return data;
  }
}