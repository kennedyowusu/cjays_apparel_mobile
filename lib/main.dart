import 'package:cjays/constants/routes.dart';
import 'package:cjays/constants/text.dart';
import 'package:cjays/controllers/binding/all_controller_binding.dart';
import 'package:cjays/views/auth/signin/sign_in.dart';
import 'package:cjays/views/home/home.dart';
import 'package:cjays/views/onboarding/onboarding.dart';
import 'package:cjays/views/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

dynamic initScreen = 1;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  initScreen = preferences.then((pref) {
    return pref.getInt('initScreen') ?? 0;
  }).timeout(Duration(seconds: 5), onTimeout: () {
    return 0;
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllControllerBinding(),
      title: ProjectText.kAppName,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute:
          initScreen == 0 ? OnboardingScreen.routeName : SplashScreen.routeName,
      routes: routes,
    );
  }
}
