import 'package:dio/dio.dart';

abstract class Failure {
  String errorMsg;

  Failure(this.errorMsg);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMsg);

  factory ServerFailure.fromDio(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout, try again");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout, try again");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout, try again");
      case DioExceptionType.unknown:
        return ServerFailure("Unknown error, try again");
      case DioExceptionType.badResponse:
        ServerFailure.fromResponse(dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request cancelled, try again");
      case DioExceptionType.connectionError:
        return ServerFailure("No internet connection, try again");
      default:
        return ServerFailure("Unexpected error, try again");
    }
    return ServerFailure("Unexpected error, try again");
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response)
  {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response["error"]["message"]);
    } else if (statusCode == 400) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }


  }
}
