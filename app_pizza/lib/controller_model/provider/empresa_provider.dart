import 'package:app_pizza/controller_bd/empresa/empresaHelper.dart';
import 'package:app_pizza/model/empresa.dart';
import 'package:flutter/foundation.dart';

class IncrementeEmpresa extends ChangeNotifier {
  var _db = EmpresaHelper();
  List<Empresa> empresa = List<Empresa>();

  void recuperarEmpresa() async {
    List empresaRecuperada = await _db.recuperarEmpresa();

    List<Empresa> listaTemporaria = List<Empresa>();
    for (var item in empresaRecuperada) {
      Empresa empresa = Empresa.fromMap(item);
      listaTemporaria.add(empresa);
    }

    empresa = listaTemporaria;
    listaTemporaria = null;
    notifyListeners();
  }

  void salvarEmpresa() async {
    Empresa empresa =
        Empresa("Pizzaria Imperial", "pizzariaimperial@gmail.com");
    int resultado = await _db.salvarEmpresa(empresa);
    notifyListeners();
  }

  void atualizar(int id, var _nomeController, var _emailController) async {
    String nome = _nomeController.text;
    String email = _emailController.text;
    Empresa empresa = Empresa(nome, email);
    int resultado = await _db.atualizarEmpresa(empresa, id);
    notifyListeners();
  }
}
