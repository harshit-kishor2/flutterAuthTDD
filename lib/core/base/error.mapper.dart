import 'package:qr_code/core/constant/index.dart';

class ErrorMapper {
  static const httpCodeUnauthorized = 401;
  static const httpCodeNotFound = 404;
  static const httpLocalDbNotFound = 1404;

  static String getErrorMessage(int statusCode) {
    switch (statusCode) {
      case httpCodeNotFound:
        return ToastMessage.noDataFound;
      case httpCodeUnauthorized:
        return ToastMessage.wrongCredentials;
      case httpLocalDbNotFound:
        return ToastMessage.noDataFoundLocalDB;
      default:
        return "${ToastMessage.somethingWrong} [$statusCode]";
    }
  }
}
