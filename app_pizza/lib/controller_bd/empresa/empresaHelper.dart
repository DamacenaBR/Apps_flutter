
import 'package:app_pizza/model/empresa.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class EmpresaHelper {

  static final String nomeTabela = "empresa";

  static final EmpresaHelper _empresaHelper = EmpresaHelper._internal();
  Database _db;

  factory EmpresaHelper(){
    return _empresaHelper;
  }

  EmpresaHelper._internal(){
  }

  get db async {

    if( _db != null ){
      return _db;
    }else{
      _db = await inicializarDB();
      await _salvarEmpresa();
      return _db;
    }

  }

  _salvarEmpresa() async {
    Empresa empresa =
        Empresa("Pizzaria Imperial", "pizzariaimperial@gmail.com");
    int resultado = await salvarEmpresa(empresa);
  }

  _onCreate(Database db, int version) async {

    String sql = "CREATE TABLE $nomeTabela ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "nome VARCHAR, "
        "email VARCHAR)";
    await db.execute(sql);

  }

  inicializarDB() async {

    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco_minha_empresa.db");

    var db = await openDatabase(localBancoDados, version: 1, onCreate: _onCreate );
    return db;

  }

  Future<int> salvarEmpresa(Empresa empresa) async {

    var bancoDados = await db;
    int resultado = await bancoDados.insert(nomeTabela, empresa.toMap() );
    return resultado;

  }

  recuperarEmpresa() async {

    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela";
    List empresa = await bancoDados.rawQuery( sql );
    return empresa;

  }

  Future<int> atualizarEmpresa(Empresa empresa, int id) async {

    var bancoDados = await db;
    return await bancoDados.update(
      nomeTabela,
      empresa.toMap(),
      where: "id = ?",
      whereArgs: [id]
    );

  }

  Future<int> removerEmpresa( int id ) async {

    var bancoDados = await db;
    return await bancoDados.delete(
      nomeTabela,
      where: "id = ?",
      whereArgs: [id]
    );

  }

}