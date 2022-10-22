import 'package:cjays/views/auth/forgot_password/forgot_password_screen.dart';
import 'package:cjays/views/auth/signin/sign_in.dart';
import 'package:cjays/views/auth/signup/sign_up_screen.dart';
import 'package:cjays/views/cart/cart_screen.dart';
import 'package:cjays/views/home/home.dart';
import 'package:cjays/views/product_details/product_details.dart';
import 'package:cjays/views/recommended/recommended.dart';
import 'package:cjays/views/splash/splash.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashScreen = '/splash-screen';
  static const String home = '/';
  static const String ownerRecommended = '/recommended';
  static const String productDetailsScreen = '/product-details-screen';
  static const String cartScreen = '/cart-screen';

  static const String loginScreen = '/login-screen';
  static const String registerScreen = '/register-screen';
  static const String forgotPasswordScreen = '/forgot-password-screen';

  static getSplashScreen() => splashScreen;
  static getInitialRoute() => home;
  static getRecommendedRoute(int screenId, String screen) =>
      '$ownerRecommended?screenId=$screenId&screen=$screen';
  static getProductDetailsScreenRoute(int screenId, String screen) =>
      '$productDetailsScreen?screenId=$screenId&screen=$screen';
  static getCartScreen() => cartScreen;

  static getLoginScreen() => loginScreen;
  static getRegisterScreen() => registerScreen;
  static getForgotPasswordScreen() => forgotPasswordScreen;

  static List<GetPage> routes = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
    ),
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
    ),
    GetPage(
      name: productDetailsScreen,
      page: () {
        String screenId = Get.parameters['screenId'] ?? '';
        String screen = Get.parameters['screen'] ?? '';
        return ProductDetailsScreen(
            screenId: int.parse(screenId), screen: screen);
      },
    ),
    GetPage(
      name: cartScreen,
      page: () {
        return CartScreen();
      },
    ),
    GetPage(
      name: loginScreen,
      page: () {
        return LoginScreen();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: registerScreen,
      page: () {
        return RegisterScreen();
      },
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () {
        return ForgotPasswordScreen();
      },
    ),
  ];
}
