class Tarefa {
  String titulo;
  bool realizada;

  Tarefa({this.titulo, this.realizada});

  Tarefa.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    realizada = json['realizada'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['realizada'] = this.realizada;
    return data;
  }
}