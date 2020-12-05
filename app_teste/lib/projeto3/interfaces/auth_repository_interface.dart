import 'package:app_teste/projeto3/core/responses/response_defult.dart';

abstract class IAuthRepository {
  Future<DefaultResponse> doLoginEmailPassword({String email, String password});
  Future<DefaultResponse> registerEmailPassword(
      {String email, String password});
  Future<DefaultResponse> getUser();
  Future<DefaultResponse> logOut();
  Future<DefaultResponse> resetPassowor({String email});
}
