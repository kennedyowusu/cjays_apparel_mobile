import 'package:cjays/constants/sizes.dart';
import 'package:cjays/views/home/components/categories.dart';
import 'package:cjays/views/home/components/discount_banner.dart';
import 'package:cjays/views/home/components/home_header.dart';
import 'package:cjays/views/home/components/popular_product.dart';
import 'package:cjays/views/home/components/special_offers.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            Categories(),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
