import 'package:app_teste/projeto3/core/errors/register_error_interceptor.dart';
import 'package:app_teste/projeto3/core/responses/response_builder.dart';
import 'package:app_teste/projeto3/core/responses/response_defult.dart';
import 'package:app_teste/projeto3/interfaces/auth_repository_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth firebaseAuth;
  final ErrorSucessInterceptor errorSucessInterceptor;

  AuthRepository(this.firebaseAuth, this.errorSucessInterceptor);

  @override
  Future<DefaultResponse> doLoginEmailPassword(
      {String email, String password}) async {
    try {
      final result = firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      if (result != null) {
        return ResponseBuilder.status(
            message: ErrorSucessInterceptor.loginSucess,
            status: ResponseBuilder.sucess);
      }
    } on Exception catch (e) {
      return ResponseBuilder.status(
          message: ErrorSucessInterceptor.erroLogin,
          status: ResponseBuilder.falid);
    }
  }

  @override
  Future<DefaultResponse> getUser() async {
    /*
    try {
      return ResponseBuilder.success<FirebaseUser>(
          object: await firebaseAuth.currentUser);
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
    */
  }

  @override
  Future<DefaultResponse> logOut() async {
    /*
    try {
      await firebaseAuth.signOut();
      return ResponseBuilder.success();
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
    */
  }

  @override
  Future<DefaultResponse> registerEmailPassword(
      {String email, String password}) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      final result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result != null) {
        return ResponseBuilder.status(
            message: ErrorSucessInterceptor.registerSucess,
            status: ResponseBuilder.sucess);
      }
    } catch (e) {
      return ResponseBuilder.status(
          message: ErrorSucessInterceptor.erroRegister,
          status: ResponseBuilder.falid);
    }
  }

  @override
  Future<DefaultResponse> resetPassowor({String email}) async {
    /*
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email.trim());
      return ResponseBuilder.success();
    } catch (e) {
      return ResponseBuilder.failed(
          object: e,
          message: e.code,
          errorInterceptor: RegisterErrorInterceptor());
    }
    */
  }
}
