import 'package:cjays/controllers/home.dart/home.dart';
import 'package:get/get.dart';

class AllControllerBinding implements Bindings {
  AllControllerBinding();

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
