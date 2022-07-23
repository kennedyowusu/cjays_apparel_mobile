import 'package:cjays/constants/styles.dart';
import 'package:cjays/enums.dart';
import 'package:cjays/views/home/home.dart';
import 'package:cjays/views/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                // icon: SvgPicture.asset(
                //   "assets/icons/Shop Icon.svg",
                //   color: MenuState.home == selectedMenu
                //       ? kPrimaryColor
                //       : inActiveIconColor,
                // ),
                icon: Icon(
                  Icons.shop,
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              IconButton(
                icon: Icon(Icons.favorite, color: inActiveIconColor),
                onPressed: () {},
              ),
              IconButton(
                // icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg"),
                icon: Icon(Icons.chat, color: inActiveIconColor),
                onPressed: () {},
              ),
              IconButton(
                // icon: SvgPicture.asset(
                //   "assets/icons/User Icon.svg",
                //   color: MenuState.profile == selectedMenu
                //       ? kPrimaryColor
                //       : inActiveIconColor,
                // ),
                icon: Icon(
                  Icons.person,
                  color: MenuState.profile == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, ProfileScreen.routeName),
              ),
            ],
          )),
    );
  }
}
