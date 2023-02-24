import 'package:get/get.dart';
import 'package:pfa_application_1/service/remote.dart';

class MedicineDescriptionBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteService>((() => RemoteService()));
  }
}
