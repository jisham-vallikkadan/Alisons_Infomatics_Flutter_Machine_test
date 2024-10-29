import 'package:flutter/cupertino.dart';

import '../utils/toast_util.dart';

class AppException {
  final String? message;
  AppException([
    this.message,
  ]);
}

class BadRequestException extends AppException {
  BadRequestException([
    super.message,
  ]);
}

class ServerFailure extends AppException {
  ServerFailure([
    super.message,
  ]);
}

class ClientFailure extends AppException {
  ClientFailure([
    super.message,
  ]);
}

void handleError(
    {required AppException error, BuildContext? context, String? errorMsg}) {
  print('error is =========$error');
  if (error is BadRequestException) {
    var message = error.message;
    ToastUtil.show(errorMsg ?? message.toString());
    print('BadRequestException $message ');
  } else if (error is ClientFailure) {
    ToastUtil.show("No Internet Connection");
  } else if (error is ServerFailure) {
    var msg = error.message;
    ToastUtil.show("ServerFailure========== $msg");
  }
}
