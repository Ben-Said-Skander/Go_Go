import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/medicine_description_controller.dart';


class MedicineDescriptionBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DescriptionController>((() => DescriptionController()));
  }
}
