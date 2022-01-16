// ignore_for_file: avoid_print, deprecated_member_use, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrl_home_quarantine_getx/Shared/network/end_points.dart';
import 'package:wrl_home_quarantine_getx/Shared/network/local/cache_helper.dart';
import 'package:wrl_home_quarantine_getx/database/models/user_model.dart';
import 'package:wrl_home_quarantine_getx/routes/routes.dart';
import 'auth_controller.dart';


class LoginController extends GetxController {
  var isLoading = false.obs;
  final loginFormKey = GlobalKey<FormState>();
  TextEditingController usernameController, passwordController;
  String username = '', password = '';
  UserModel myModel;

  @override
  void onInit() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String validateUsername(String value) {
    if (!GetUtils.isUsername(value)) {
      return 'This is wrong username';
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
    if (value.length < 5) {
      return 'This is wrong password';
    } else {
      return null;
    }
  }

  Future<dynamic> doLogin(context) async {
    bool isValidate = loginFormKey.currentState.validate();
    if (isValidate) {
      isLoading(true);
      DioHelper.postData(
        url: login,
        data: {
          'username': usernameController.text,
          'password': passwordController.text,
        },
      ).then(
        (value) {
          if (value != null) {
            // loginFormKey.currentState.save();
            myModel = UserModel.fromJson(value.data);
            // print(value.data);
            if (myModel.message == 'returned token') {
              CacheHelper.putBoolean(key: 'token', value: true);
              // navigateAndFinish(context, const WifiView());
              Get.offAndToNamed(AppRoutes.wifi);
            }
            // print();
          }
          isLoading(false);
        },
      ).catchError(
        (error) {
          print(error.toString());
          Get.snackbar('Login', 'problem in Login');
          isLoading(false);
        },
      );
    }
  }
}
