import 'package:cjays/views/home/home.dart';
import 'package:cjays/views/product_details/product_details.dart';
import 'package:cjays/views/recommended/recommended.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String home = '/';
  static const String recommended = '/recommended';
  static const String productDetailsScreen = '/product-details-screen';

  // static getProductDetailsScreenRoute(String productId) {
  //   return Get.toNamed(productDetailsScreen, arguments: productId);
  // }

  static getInitialRoute() => home;
  static getRecommendedRoute() => recommended;
  static getProductDetailsScreenRoute(String productId) =>
      '$productDetailsScreen/$productId';

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
      page: () => ProductDetailsScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
