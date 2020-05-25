class Empresa{

  int id;
  String nome;
  String email;


  Empresa(this.nome, this.email,);

  Empresa.fromMap(Map map){

    this.id = map["id"];
    this.nome = map["nome"];
    this.email = map["email"];

  }

  Map toMap(){

    Map<String, dynamic> map = {
      "nome" : this.nome,
      "email" : this.email,
    };

    if( this.id != null ){
      map["id"] = this.id;
    }

    return map;

  }

}