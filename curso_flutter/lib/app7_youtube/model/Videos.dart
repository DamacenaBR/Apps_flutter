class Video {
  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;

  Video({this.id, this.titulo, this.descricao, this.imagem, this.canal});

  Video.fromJson(Map<String, dynamic> json) {
    id = json["id"]["videoId"];
    titulo = json["snippet"]["title"];
    descricao = json["snippet"]["description"];
    imagem = json["snippet"]["thumbnails"]["high"]["url"];
    canal = json["snippet"]["channelTitle"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
      data["id"]["videoId"] = id;
      data["snippet"]["title"] = titulo;
      data["snippet"]["description"] = descricao;
      data["snippet"]["thumbnails"]["high"]["url"] = imagem;
      data["snippet"]["channelTitle"] =canal;
    return data;
  }

  static fromJson2(Map<String, dynamic> json) {
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      descricao: json["snippet"]["description"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelTitle"],
    );
  }

  factory Video.fromJson3(Map<String, dynamic> json){
      return Video(
        id: json["id"]["videoId"],
        titulo: json["snippet"]["title"],
        descricao: json["snippet"]["description"],
        imagem: json["snippet"]["thumbnails"]["high"]["url"],
        canal: json["snippet"]["channelTitle"],
      );
    }
}
