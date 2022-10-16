import 'package:cjays/views/all_category/all_categories.dart';
import 'package:cjays/views/home/home.dart';
import 'package:cjays/views/product_details/product_details.dart';
import 'package:cjays/views/recommended/recommended.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String home = '/';
  static const String recommended = '/recommended';
  static const String productDetailsScreen = '/product-details-screen';
  static const String allCategoryScreen = '/all-category-screen';

  // static getProductDetailsScreenRoute(String productId) {
  //   return Get.toNamed(productDetailsScreen, arguments: productId);
  // }

  static getInitialRoute() => home;
  static getRecommendedRoute() => recommended;
  static getProductDetailsScreenRoute(int productId) =>
      '$productDetailsScreen?productId=$productId';

  static getAllCategoryScreen(int categoryId) =>
      "$allCategoryScreen?categoryId=$categoryId";

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: recommended,
      page: () => RecommendationsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: productDetailsScreen,
      page: () {
        String? productId = Get.parameters['productId'];
        return ProductDetailsScreen(productId: int.parse(productId!));
      },
      transition: Transition.fadeIn,
    ),
  ];
}
