import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/product_model.dart';
import '../utils/constants.dart';
import '../utils/shared_preference.dart';
import 'NetWorkHelper.dart';
import 'app_exceptions.dart';

class NetworkService {
  Future<Either<AppException, ProductListModel>> getProductList({
    required BuildContext context,
  }) async {
    late String token;
    late String id;
    final bool hasToken = await SharedPrefUtil.contains(keyAccessToken);
    if (hasToken) {
      token = await SharedPrefUtil.getString(keyAccessToken);
      id=await SharedPrefUtil.getString(keyAccessId);
    } else {
      token = "";
    }

    Either<AppException, Response?> response;
    response = await DioNetworkHelpers().postRequest(
        url: 'https://swan.alisonsnewdemo.online/api/home',
        body: {'token': token, "id": id});
    return await response.fold((error) {
      return left(error);
    }, (result) async {
      return right(ProductListModel.fromJson(result!.data));
    });
  }

  Future<Either<AppException, dynamic>> login({
    required BuildContext context,
    required String? email,
    required String? pass,
  }) async {
    Either<AppException, Response?> response;
    response = await DioNetworkHelpers().postRequest(
        url: 'https://swan.alisonsnewdemo.online/api/login',
        body: {'email_phone': email, "password": pass});
    return await response.fold((error) {
      return left(error);
    }, (result) async {
      return right(result!.data);
    });
  }
}
