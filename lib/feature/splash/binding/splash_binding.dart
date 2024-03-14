import 'package:bellnotification1/feature/Introduction/controller/introduction_controller.dart';
import 'package:get/get.dart';

import '../controller/splash_controller.dart';



class SplashBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(SplashController());
    Get.put(IntroController());

  }
}
