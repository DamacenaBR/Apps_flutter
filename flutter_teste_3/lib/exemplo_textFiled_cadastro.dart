import "package:flutter/material.dart";

class ExemploTextField extends StatelessWidget {
  TextEditingController _nome = TextEditingController();
  TextEditingController _cpf = TextEditingController();
  TextEditingController _telefone = TextEditingController();
  TextEditingController _email = TextEditingController();

  void cadastrarDados() {
    print("==Cadastrado==");
    print("Nome: ${_nome.text}");
    print("Cpf: ${_cpf.text}");
    print("Telefone: ${_telefone.text}");
    print("Email: ${_email.text}");
  }

  @override
  Widget build(BuildContext context) {
    //SingleChildScrollView
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Cadastro",
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildTextFiled(
                    hint: "Digite o nome",
                    label: "Nome",
                    control: _nome,
                    type: TextInputType.text),
                buildTextFiled(
                    hint: "Digite o cpf",
                    label: "Cpf",
                    control: _cpf,
                    type: TextInputType.text),
                buildTextFiled(
                    hint: "Digite o telefone",
                    label: "Telefone",
                    control: _telefone,
                    type: TextInputType.phone),
                buildTextFiled(
                    hint: "Digite o email",
                    label: "Email",
                    control: _email,
                    type: TextInputType.emailAddress),
                RaisedButton(
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    cadastrarDados();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

Widget buildTextFiled(
    {String label,
    String hint,
    TextEditingController control,
    TextInputType type}) {
  return TextField(
    controller: control,
    keyboardType: type,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(fontSize: 20),
      hintText: hint,
      hintStyle: TextStyle(fontSize: 20),
      helperText: "Obrigatório",
      helperStyle: TextStyle(color: Colors.red, fontSize: 15),
      border: OutlineInputBorder(),
    ),
  );
}