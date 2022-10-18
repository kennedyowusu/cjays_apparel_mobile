import 'package:cjays/views/cart/cart_screen.dart';
import 'package:cjays/views/home/home.dart';
import 'package:cjays/views/product_details/product_details.dart';
import 'package:cjays/views/recommended/recommended.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String home = '/';
  static const String ownerRecommended = '/recommended';
  static const String productDetailsScreen = '/product-details-screen';
  static const String cartScreen = '/cart-screen';

  static getInitialRoute() => home;
  static getRecommendedRoute(int screenId, String screen) =>
      '$ownerRecommended?screenId=$screenId&screen=$screen';
  static getProductDetailsScreenRoute(int screenId, String screen) =>
      '$productDetailsScreen?screenId=$screenId&screen=$screen';
  static getCartScreen() => cartScreen;

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: ownerRecommended,
      page: () {
        String screenId = Get.parameters['screenId'] ?? '';
        String screen = Get.parameters['screen'] ?? '';
        return RecommendationsScreen(
            screenId: int.parse(screenId), screen: screen);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: productDetailsScreen,
      page: () {
        String screenId = Get.parameters['screenId'] ?? '';
        String screen = Get.parameters['screen'] ?? '';
        return ProductDetailsScreen(
            screenId: int.parse(screenId), screen: screen);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartScreen,
      page: () {
        return CartScreen();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
