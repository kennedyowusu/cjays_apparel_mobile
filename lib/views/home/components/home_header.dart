import 'package:cjays/constants/sizes.dart';
import 'package:cjays/views/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            // svgSrc: "assets/icons/Cart Icon.svg",
            svgSrc: Icons.shopping_bag,
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          IconBtnWithCounter(
            svgSrc: IconData(0xF141),
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
