import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/product_model.dart';
import '../screens/home/home_screen.dart';
import '../service/app_exceptions.dart';
import '../service/network_service.dart';
import '../utils/constants.dart';
import '../utils/shared_preference.dart';

class HomeProvider with ChangeNotifier {
  bool isLoading = false;

  Future accountLogin({
    BuildContext? context,
    String? email,
    String? password,
  }) async {
    isLoading = true;
    notifyListeners();
    Either<AppException, dynamic> result = await NetworkService()
        .login(context: context!, email: email!, pass: password);
    result.fold((error) {
      isLoading = false;
      notifyListeners();
      return left(error);
    }, (result) {
      print('result is----$result');
      if (result['success'] == 1) {
        Fluttertoast.showToast(msg: result["message"]);
        isLoading = false;
        SharedPrefUtil.writeString(
            keyAccessToken, result["customerdata"]['token']);
        SharedPrefUtil.writeString(keyAccessId, result["customerdata"]['id']);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false);
      } else {
        Fluttertoast.showToast(msg: result["message"]);
        isLoading = false;
        notifyListeners();
      }
      notifyListeners();
    });
  }

  ProductListModel? productList;

  Future getProductList(
    BuildContext? context,
  ) async {
    isLoading = true;
    // notifyListeners();
    Either<AppException, ProductListModel> responce =
        await NetworkService().getProductList(
      context: context!,
    );
    responce.fold((error) {
      print('error iss----$error');
      isLoading = false;
      notifyListeners();
      return left(error);
    }, (result) {
      productList = result;
      isLoading = false;
      notifyListeners();
    });
  }
}
