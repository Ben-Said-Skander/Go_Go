import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/blog_controller.dart';

class BlogBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlogController>((() => BlogController()));
  }
}
