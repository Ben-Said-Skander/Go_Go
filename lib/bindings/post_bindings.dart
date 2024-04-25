import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/post_controller.dart';

class PostBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostController>((() => PostController()));
  }
}
