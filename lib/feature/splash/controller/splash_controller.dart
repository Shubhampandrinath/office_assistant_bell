import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Core/routes.dart';

class SplashController extends GetxController {
  final getStorage = GetStorage();

  bool isLogin = false;
  String post = '';

  @override
  void onInit() {
    getdata();
    Timer(Duration(seconds: 3), () {
      if (isLogin) {
        Get.offAndToNamed(Routes.HomePage);
      } else {
        Get.offAllNamed(Routes.intro);
      }
    });
    super.onInit();
  }

  Future<void> getdata() async {
    var pref = await SharedPreferences.getInstance();
    isLogin = pref.getBool('isLogin')!;
  }



}
