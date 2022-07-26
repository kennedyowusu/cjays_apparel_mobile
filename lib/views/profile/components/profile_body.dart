import 'package:cjays/constants/images.dart';
import 'package:cjays/controllers/auth/auth_controller.dart';
import 'package:cjays/controllers/cart_controller.dart';
import 'package:cjays/controllers/user_controller.dart';
import 'package:cjays/routes/routes_helper.dart';
import 'package:cjays/widgets/auth_button.dart';
import 'package:cjays/widgets/loader.dart';
import 'package:cjays/widgets/medium_text.dart';
import 'package:cjays/widgets/no_data_view.dart';
import 'package:cjays/widgets/project_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    bool userLoggedIn = Get.find<AuthenticationController>().isUserLoggedIn();

    if (userLoggedIn) {
      Get.find<UserController>().getUserData();
      debugPrint("User Logged In");
    } else {
      debugPrint("User Not Logged In");
    }
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GetBuilder<UserController>(
        builder: (userController) {
          return userLoggedIn
              ? (userController.isLoading
                  ? Column(
                      children: [
                        ProfilePic(),
                        SizedBox(height: 20),
                        ProfileMenu(
                          text: userController.userModel.name ?? "Your Name",
                          iconData: Icons.person,
                          press: () => {},
                        ),
                        ProfileMenu(
                          text: userController.userModel.phone ?? "Your Phone",
                          iconData: Icons.phone_android_sharp,
                          press: () {},
                        ),
                        ProfileMenu(
                          text: userController.userModel.email ?? "Your Email",
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
                            if (Get.find<AuthenticationController>()
                                .isUserLoggedIn()) {
                              Get.find<AuthenticationController>().logUserOut();
                              Get.find<CartController>().clearCart();
                              Get.find<CartController>().clearCartHistory();
                              Get.offNamed(RouteHelper.getLoginScreen());
                            }
                          },
                        ),
                      ],
                    )
                  : Center(
                      child: Loader(),
                    ))
              : Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ProjectImages.kNoProfileData,
                        height: height * 0.5,
                        width: width * 0.5,
                      ),
                      MediumText(
                        text: "Please Login to view your profile",
                      ),
                      SizedBox(
                        height: ProjectDimensions.heightTwenty * 3.7,
                        width: width * 0.8,
                        child: AuthButton(
                          text: "Sign In",
                          onPressed: () {
                            Get.offNamed(RouteHelper.getLoginScreen());
                          },
                          height: height,
                          width: double.maxFinite,
                        ),
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}
