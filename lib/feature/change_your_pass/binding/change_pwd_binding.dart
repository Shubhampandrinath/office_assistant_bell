
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:bellnotification1/feature/change_your_pass/controller/change_pwd_controller.dart';

class ChangepassBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(()=>ChangeYourPassController());
    Get.put(ChangeYourPassController());
  }

}