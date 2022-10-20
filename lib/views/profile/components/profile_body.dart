import 'package:flutter/material.dart';

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
            text: "Log Out",
            iconData: Icons.logout,
            press: () {},
          ),
        ],
      ),
    );
  }
}
