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

/*Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: TextField(
            keyboardType: TextInputType.phone,
            controller: _textoFone,
            style: TextStyle(fontSize: 20, color: Colors.red),
            cursorColor: Colors.orange,
            cursorWidth: 12,
            cursorRadius: Radius.circular(50),
            maxLength: 10,
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFF2F2F2),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.indigo),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.red),
              ),
            ),
          ),
        )
      ],
    ),
  );
}*/
