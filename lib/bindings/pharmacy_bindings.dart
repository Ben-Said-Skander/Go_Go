import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/pharmacyController.dart';

class PharmaciesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PharmacyController>((() => PharmacyController()));
  }
}
