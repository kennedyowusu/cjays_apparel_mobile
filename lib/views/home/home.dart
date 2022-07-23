import 'package:cjays/enums.dart';
import 'package:cjays/views/home/components/home_body.dart';
import 'package:cjays/widgets/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: HomeBody(),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      ),
    );
  }
}
