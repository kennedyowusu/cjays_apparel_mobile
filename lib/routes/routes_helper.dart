import 'package:cjays/views/home/home.dart';
import 'package:cjays/views/product_details/product_details.dart';
import 'package:cjays/views/recommended/recommended.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String home = '/';
  static const String ownerRecommended = '/recommended';
  static const String productDetailsScreen = '/product-details-screen';

  static getInitialRoute() => home;
  static getRecommendedRoute(int screenId) =>
      '$ownerRecommended?screenId=$screenId';
  static getProductDetailsScreenRoute(int screenId) =>
      '$productDetailsScreen?screenId=$screenId';

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: ownerRecommended,
      page: () {
        String screenId = Get.parameters['screenId'] ?? '';
        return RecommendationsScreen(screenId: int.parse(screenId));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: productDetailsScreen,
      page: () {
        String screenId = Get.parameters['screenId'] ?? '';
        return ProductDetailsScreen(screenId: int.parse(screenId));
      },
      transition: Transition.fadeIn,
    ),
  ];
}
