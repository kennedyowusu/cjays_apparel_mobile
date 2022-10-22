import 'package:cjays/controllers/auth/auth_controller.dart';
import 'package:cjays/controllers/cart_controller.dart';
import 'package:cjays/routes/routes_helper.dart';
import 'package:cjays/widgets/display_message.dart';
import 'package:cjays/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Name",
            iconData: Icons.person,
            press: () => {},
          ),
          ProfileMenu(
            text: "Phone Number",
            iconData: Icons.phone_android_sharp,
            press: () {},
          ),
          ProfileMenu(
            text: "Email Address",
            iconData: Icons.email,
            press: () {},
          ),
          ProfileMenu(
            text: "House Address",
            iconData: Icons.location_on,
            press: () {},
          ),
          ProfileMenu(
            text: "Messages",
            iconData: Icons.message,
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            iconData: Icons.logout,
            press: () {
              if (Get.find<AuthenticationController>().isUserLoggedIn()) {
                Get.find<AuthenticationController>().logUserOut();
                Get.find<CartController>().clearCart();
                Get.find<CartController>().clearCartHistory();
                Get.offNamed(RouteHelper.getLoginScreen());

                // Get.dialog(
                //   Center(
                //     child: Loader(),
                //   ),
                // );
                // Future.delayed(Duration(seconds: 2), () {
                //   Get.back();
                //   Get.offNamed(RouteHelper.getLoginScreen());
                // });
              }
            },
          ),
        ],
      ),
    );
  }
}
