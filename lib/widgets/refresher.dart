import 'package:cjays/controllers/cart_controller.dart';
import 'package:cjays/controllers/category_controller.dart';
import 'package:cjays/controllers/product_controller.dart';
import 'package:cjays/controllers/recommended_controller.dart';
import 'package:get/get.dart';

Future<void> loadResources() async {
  await Get.find<CategoryController>().getCategoryList();
  await Get.find<ProductController>().getProductList();
  Get.find<RecommendedController>().getRecommendedList();
  Get.find<CartController>();
}
