import 'package:bellnotification1/feature/home_page/controller/home_page-controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_instance/src/bindings_interface.dart';


class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());


  }

}