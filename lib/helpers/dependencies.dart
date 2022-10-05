import 'package:cjays/controllers/category_controller.dart';
import 'package:cjays/controllers/product_controller.dart';
import 'package:cjays/data/api/api_client.dart';
import 'package:cjays/data/repository/category_repo.dart';
import 'package:cjays/utils/app_constants.dart';
import 'package:get/get.dart';

import '../data/repository/product_repo.dart';

Future<void> init() async {
  // Api Client
  Get.lazyPut(
    () => ApiClient(appBaseUrl: ProjectConstants.BASE_URL),
  );

  // Repositories
  Get.lazyPut(
    () => ProductRepository(
      apiClient: Get.find(),
    ),
  );

  Get.lazyPut(() => CategoryRepository(apiClient: Get.find()));

  // Controllers
  Get.lazyPut(
    () => ProductController(
      productRepository: Get.find(),
    ),
  );

  Get.lazyPut(() => CategoryController(categoryRepository: Get.find()));
}
