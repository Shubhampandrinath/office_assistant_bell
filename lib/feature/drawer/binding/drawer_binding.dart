import 'package:get/get.dart';
import 'package:bellnotification1/feature/drawer/controller/drawer_controller.dart';

class DrawerBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
   Get.put(DrawersController());
  }

}