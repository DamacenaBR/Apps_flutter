import 'package:app_teste/projeto3/core/errors/register_error_interceptor.dart';
import 'response_defult.dart';

class ResponseBuilder {
  static final String falid = "falid";
  static final String sucess = "sucess";

  static DefaultResponse status({String message, String status}) {
    if (status == falid) {
      message = ErrorSucessInterceptor.errorFalid(message);
      return DefaultResponse(message: message, status: status);
    } else if (status == sucess) {
      message = ErrorSucessInterceptor.sucess(message);
      return DefaultResponse(message: message, status: status);
    }
  }
}
