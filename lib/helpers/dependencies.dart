import 'package:cjays/controllers/auth/auth_controller.dart';
import 'package:cjays/controllers/cart_controller.dart';
import 'package:cjays/controllers/category_controller.dart';
import 'package:cjays/controllers/location_controller.dart';
import 'package:cjays/controllers/product_controller.dart';
import 'package:cjays/controllers/recommended_controller.dart';
import 'package:cjays/controllers/user_controller.dart';
import 'package:cjays/data/api/api_client.dart';
import 'package:cjays/data/repository/auth_repo.dart';
import 'package:cjays/data/repository/cart_repo.dart';
import 'package:cjays/data/repository/category_repo.dart';
import 'package:cjays/data/repository/location_repo.dart';
import 'package:cjays/data/repository/product_category_repo.dart';
import 'package:cjays/data/repository/recommended_repo.dart';
import 'package:cjays/data/repository/user_repo.dart';
import 'package:cjays/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/product_repo.dart';

Future<void> init() async {
  // Shared Preferences
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => preferences);

  // Api Client
  Get.lazyPut(
    () => ApiClient(
        appBaseUrl: ProjectConstants.BASE_URL, preferences: Get.find()),
  );

  // Repositories
  Get.lazyPut(() =>
      AuthenticationRepository(apiClient: Get.find(), preferences: Get.find()));

  Get.lazyPut(() => UserRepository(apiClient: Get.find()));

  Get.lazyPut(
    () => ProductRepository(
      apiClient: Get.find(),
    ),
  );

  Get.lazyPut(() => CategoryRepository(apiClient: Get.find()));

  Get.lazyPut(() => ProductCategoryRepository(apiClient: Get.find()));

  Get.lazyPut(() => CartRepository(preferences: Get.find()));

  Get.lazyPut(() => RecommendedRepository(apiClient: Get.find()));

  Get.lazyPut(
      () => LocationRepository(apiClient: Get.find(), preferences: Get.find()));

  // Controllers
  Get.lazyPut(
      () => AuthenticationController(authenticationRepository: Get.find()));

  Get.lazyPut(() => UserController(userRepository: Get.find()));

  Get.lazyPut(
    () => ProductController(
      productRepository: Get.find(),
    ),
  );

  Get.lazyPut(() => CategoryController(categoryRepository: Get.find()));
  Get.lazyPut(() => CartController(cartRepository: Get.find()));
  Get.lazyPut(() => RecommendedController(recommendedRepository: Get.find()));
  Get.lazyPut(() => LocationController(locationRepository: Get.find()));
}
