import 'package:cjays/views/home/home.dart';
import 'package:cjays/views/product_details/product_details.dart';
import 'package:cjays/views/recommended/recommended.dart';
import 'package:cjays/views/triel.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String home = '/';
  static const String recommended = '/recommended';
  static const String productDetailsScreen = '/product-details-screen';
  static const String allCategoryScreen = '/all-category-screen';

  static const String trialScreen = '/trial-screen';

  // static getProductDetailsScreenRoute(String productId) {
  //   return Get.toNamed(productDetailsScreen, arguments: productId);
  // }

  static getInitialRoute() => home;
  static getRecommendedRoute() => recommended;
  static getProductDetailsScreenRoute(int screenId) =>
      '$productDetailsScreen?screenId=$screenId';

  static getTrialScreenRoute() => trialScreen;

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
        String screenId = Get.parameters['screenId'] ?? '';
        return ProductDetailsScreen(screenId: int.parse(screenId));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: trialScreen,
      page: () => TrialDetails(),
      transition: Transition.fadeIn,
    ),
  ];
}
