import 'package:cjays/constants/text.dart';
import 'package:cjays/controllers/binding/all_controller_binding.dart';
import 'package:cjays/controllers/cart_controller.dart';
import 'package:cjays/controllers/category_controller.dart';
import 'package:cjays/controllers/product_controller.dart';
import 'package:cjays/controllers/recommended_controller.dart';
import 'package:cjays/routes/routes_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helpers/dependencies.dart' as dependencies;

dynamic initScreen = 1;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  initScreen = preferences.then((pref) {
    return pref.getInt('initScreen') ?? 0;
  }).timeout(Duration(seconds: 5), onTimeout: () {
    return 0;
  });

  await dependencies.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<CategoryController>(
      builder: (categoryController) {
        return GetBuilder<ProductController>(
          builder: (productController) {
            return GetBuilder<ProductController>(
              builder: (recommendedController) {
                return GetBuilder<CartController>(
                  builder: (cartController) {
                    return GetMaterialApp(
                      initialBinding: AllControllerBinding(),
                      title: ProjectText.kAppName,
                      debugShowCheckedModeBanner: false,
                      defaultTransition: Transition.rightToLeft,
                      // initialRoute:
                      //     initScreen == 0 ? OnboardingScreen.routeName : SplashScreen.routeName,
                      // routes: routes,
                      // home: SplashScreen(),
                      initialRoute: RouteHelper.getSplashScreen(),
                      getPages: RouteHelper.routes,
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
