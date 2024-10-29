import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../utils/constants.dart';
import '../utils/shared_preference.dart';
import '../utils/toast_util.dart';
import 'app_exceptions.dart';

class DioNetworkHelpers {
  var _dio = Dio();

  // Future<Either<AppException, Response>> getRequest(
  //     String? url, BuildContext? context,
  //     [Map<String, dynamic>? queryParameters]) async {
  //   late String token;
  //   final bool hasToken = await SharedPrefUtil.contains(keyAccessToken);
  //   if (hasToken) {
  //     token = await SharedPrefUtil.getString(keyAccessToken);
  //   } else {
  //     token = "";
  //   }
  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json',
  //     "Authorization": "Bearer $token"
  //   };
  //   print('token is ---$token --------$headers');
  //   Either<AppException, Response> result;
  //   try {
  //     result = _returnResponse(
  //         await _dio.get(url!, queryParameters: queryParameters));
  //     log("urls:-$url ---headers:-$headers----");
  //   } catch (e) {
  //     if (e is DioError) {
  //       debugPrint('error is ${e.error}');
  //       if (e.error is SocketException) {
  //         return left(ClientFailure());
  //       } else {
  //         if (e.response != null) {
  //           result = _returnResponse(e.response!);
  //         } else {
  //           result = left(ServerFailure(
  //               'Error occurred while communication with server'));
  //         }
  //       }
  //     } else {
  //       result = left(
  //           ServerFailure('Error occurred while communication with server'));
  //     }
  //   }
  //   return result;
  // }

  Future<Either<AppException, Response>> postRequest({
    String? url,
    Map<String, dynamic>? body,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    Either<AppException, Response> result;
    try {
      result = _returnResponse(await _dio.post(url!,
          data: body, options: Options(headers: headers)));
      log("urls:-$url ---headers:-$headers----");
    } catch (e) {
      if (e is DioError) {
        debugPrint('error is ${e.error}');
        if (e.error is SocketException) {
          return left(ClientFailure());
        } else {
          if (e.response != null) {
            result = _returnResponse(e.response!);
          } else {
            result = left(ServerFailure(
                'Error occurred while communication with server'));
          }
        }
      } else {
        result = left(
            ServerFailure('Error occurred while communication with server'));
      }
    }
    return result;
  }

  Either<AppException, Response> _returnResponse(Response response) {
    debugPrint("-- status:${response.statusCode}");
    switch (response.statusCode) {
      case 200:
        return right(response);
      case 400:
        return left(BadRequestException(response.data.toString()));
      case 500:
      default:
        return left(ServerFailure(
            "Error occurred while communication with server with status code : ${response.statusCode}"));
    }
  }
}
