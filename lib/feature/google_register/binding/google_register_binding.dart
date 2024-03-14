import 'package:get/get.dart';
import 'package:bellnotification1/feature/google_register/controller/google_register_controller.dart';

class GoogleRegisterBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(GoogleRegisterController());

  }

}