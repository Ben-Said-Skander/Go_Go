import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/medicine_controller.dart';

class MedicinesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicineController>((() => MedicineController()));
  }
}
