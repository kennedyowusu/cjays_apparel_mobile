import 'package:cjays/constants/routes.dart';
import 'package:cjays/constants/text.dart';
import 'package:cjays/controllers/binding/all_controller_binding.dart';
import 'package:cjays/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
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
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
