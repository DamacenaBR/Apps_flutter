// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$emailAtom = Atom(name: '_AuthControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$isCarregandoAtom = Atom(name: '_AuthControllerBase.isCarregando');

  @override
  bool get isCarregando {
    _$isCarregandoAtom.reportRead();
    return super.isCarregando;
  }

  @override
  set isCarregando(bool value) {
    _$isCarregandoAtom.reportWrite(value, super.isCarregando, () {
      super.isCarregando = value;
    });
  }

  final _$senhaAtom = Atom(name: '_AuthControllerBase.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$mensagemErroAtom = Atom(name: '_AuthControllerBase.mensagemErro');

  @override
  String get mensagemErro {
    _$mensagemErroAtom.reportRead();
    return super.mensagemErro;
  }

  @override
  set mensagemErro(String value) {
    _$mensagemErroAtom.reportWrite(value, super.mensagemErro, () {
      super.mensagemErro = value;
    });
  }

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIsCarregando(bool value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.changeIsCarregando');
    try {
      return super.changeIsCarregando(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeMensagemErro(String value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.changeMensagemErro');
    try {
      return super.changeMensagemErro(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSenha(String value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.changeSenha');
    try {
      return super.changeSenha(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
isCarregando: ${isCarregando},
senha: ${senha},
mensagemErro: ${mensagemErro}
    ''';
  }
}
