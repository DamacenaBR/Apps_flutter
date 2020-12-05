import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  /// Alterado para idTokenChanges à medida que atualiza dependendo de mais casos.
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  /// Isso não abrirá rotas para que você possa fazer algo como
  /// Navigator.of (context) .pushNamedAndRemoveUntil ('/', (Route <dynamic> route) => false);
  /// depois de chamar este método se você quiser abrir todas as rotas.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  /// Existem muitas maneiras diferentes de como você pode fazer o tratamento de exceções.
  /// Isso é para torná-lo o mais fácil possível, mas a melhor maneira seria
  /// use sua própria classe personalizada que pegaria a exceção e retornaria melhor
  /// mensagens de erro. Dessa forma, você pode jogar, retornar ou o que preferir com isso.
  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
