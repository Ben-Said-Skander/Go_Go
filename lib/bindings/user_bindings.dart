import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/register_controller.dart';

class UserBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>((() => RegisterController()));
  }
}
