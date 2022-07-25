import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/images.dart';
import 'package:cjays/constants/sizes.dart';
import 'package:cjays/constants/styles.dart';
import 'package:cjays/controllers/auth/auth.dart';
import 'package:cjays/utils/secure_storage.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with TickerProviderStateMixin {
  UserSecureStorage userSecureStorage = UserSecureStorage();

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 1, vsync: this);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  controller: tabController,
                  labelColor: ProjectColors.kBlackColor,
                  unselectedLabelColor:
                      ProjectColors.kBlackColor.withOpacity(0.5),
                  indicatorColor: ProjectColors.kBlackColor,
                  indicatorWeight: 3.0,
                  indicatorSize: TabBarIndicatorSize.values[0],
                  indicatorPadding: EdgeInsets.only(
                    top: height * 0.00,
                    left: width * 0.0395,
                    right: width * 0.031,
                  ),
                  isScrollable: true,
                  tabs: [
                    Text(
                      "Women".toUpperCase(),
                      style: kTabBarItemFontStyle.copyWith(
                        fontSize: 18.0 * kMultiplier * height,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold,
                        color: ProjectColors.kBlackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: height * 0.012,
                top: height * 0.002,
              ),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: height * 0.060,
                    width: width * 0.94,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        "Free Delivery Over GHS500",
                        style: TextStyle(
                          fontSize: height * 0.02,
                          color: ProjectColors.kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: height * 0.012,
                    ),
                    height: height * 0.75,
                    width: double.infinity,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (_, i) {
                            return Column(
                              children: [
                                Container(
                                  height: height * 0.085,
                                  width: width * 0.94,
                                  color:
                                      ProjectColors.kGreyColor.withOpacity(0.4),
                                  padding: EdgeInsets.only(
                                    left: height * 0.012,
                                  ),
                                  margin: EdgeInsets.only(
                                    right: 10,
                                    top: height * 0.007,
                                    bottom: 0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SecondHeader(
                                        height: height,
                                        title: 'Monthly Discounts',
                                        icon: Icons.percent_outlined,
                                      ),
                                      SecondHeader(
                                        height: height,
                                        title: 'Free Returns',
                                        icon: Icons.calendar_today_outlined,
                                        subtitle: '30d',
                                      ),
                                      SecondHeader(
                                        height: height,
                                        title: 'Delivery Service',
                                        icon: Icons.local_shipping_outlined,
                                      ),
                                      SecondHeader(
                                        height: height,
                                        title: 'Stripe Pay',
                                        icon: Icons.money_outlined,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: height * 0.101,
                                  width: width * 0.94,
                                  color: ProjectColors.kPrimaryColor,
                                  margin: EdgeInsets.only(
                                    right: 10,
                                    top: height * 0.007,
                                    bottom: 0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: height * 0.010,
                                            ),
                                            child: Text(
                                              "new arrivals ".toUpperCase(),
                                              style:
                                                  kTabBarItemFontStyle.copyWith(
                                                fontSize: height * 0.02,
                                                color:
                                                    ProjectColors.kWhiteColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: height * 0.010,
                                            ),
                                            child: RichText(
                                              text: TextSpan(
                                                text: 'down to '.toUpperCase(),
                                                style: kTabBarItemFontStyle
                                                    .copyWith(
                                                  fontSize: height * 0.02,
                                                  color:
                                                      ProjectColors.kWhiteColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: 'GHS50.00',
                                                    style: kTabBarItemFontStyle
                                                        .copyWith(
                                                      fontSize: height * 0.02,
                                                      color: ProjectColors
                                                          .kWhiteColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: height * 0.032,
                                        width: width * 0.22,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: ProjectColors.kWhiteColor,
                                            width: 1.2,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Shop Now".toUpperCase(),
                                            style: TextStyle(
                                              fontSize: height * 0.015,
                                              color: ProjectColors.kWhiteColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: width * 0.94,
                                  height: height * 0.20,
                                  margin: EdgeInsets.only(
                                    right: 10,
                                    top: height * 0.007,
                                    bottom: 0,
                                  ),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        ProjectImages.kDiscountSale,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        ProjectImages.kCelebrate,
                                        height: height * 0.20,
                                        width: width * 0.40,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          DiscountText(
                                            height: height,
                                            text: "Celebrate Black Friday",
                                            fontWeight: FontWeight.w600,
                                            size: height * 0.02,
                                          ),
                                          DiscountText(
                                            height: height,
                                            text: "with",
                                            fontWeight: FontWeight.w600,
                                            size: height * 0.02,
                                          ),
                                          DiscountText(
                                            height: height,
                                            text: "50% off",
                                            fontWeight: FontWeight.bold,
                                            size: height * 0.04,
                                          ),
                                          DiscountText(
                                            height: height,
                                            text: "All Products",
                                            fontWeight: FontWeight.bold,
                                            size: height * 0.02,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.007,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ProductAndText(
                                      height: height,
                                      name: "Dresses",
                                      image: ProjectImages.kDress,
                                      width: width,
                                    ),
                                    SizedBox(
                                      width: width * 0.075,
                                    ),
                                    ProductAndText(
                                      height: height,
                                      name: "Shirts",
                                      image: ProjectImages.kShirt,
                                      width: width,
                                    ),
                                    SizedBox(
                                      width: width * 0.075,
                                    ),
                                    ProductAndText(
                                      height: height,
                                      name: "Shoes",
                                      image: ProjectImages.kShoes,
                                      width: width,
                                    ),
                                    SizedBox(
                                      width: width * 0.075,
                                    ),
                                    ProductAndText(
                                      height: height,
                                      name: "Suits",
                                      image: ProjectImages.kSuits,
                                      width: width,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ProductAndText(
                                      height: height,
                                      name: "Pajamas",
                                      image: ProjectImages.kPajamas,
                                      width: width,
                                    ),
                                    SizedBox(
                                      width: width * 0.075,
                                    ),
                                    ProductAndText(
                                      height: height,
                                      name: "Jeans",
                                      image: ProjectImages.kJeans,
                                      width: width,
                                    ),
                                    SizedBox(
                                      width: width * 0.075,
                                    ),
                                    ProductAndText(
                                      height: height,
                                      name: "Heels",
                                      image: ProjectImages.kHeels,
                                      width: width,
                                    ),
                                    SizedBox(
                                      width: width * 0.075,
                                    ),
                                    ProductAndText(
                                      height: height,
                                      name: "Bags",
                                      image: ProjectImages.kBags,
                                      width: width,
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductAndText extends StatelessWidget {
  const ProductAndText({
    Key? key,
    required this.height,
    required this.name,
    required this.image,
    required this.width,
  }) : super(key: key);

  final double height, width;
  final String name, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: height * 0.05,
              backgroundColor: ProjectColors.kGreyColor.withOpacity(0.5),
              child: Image.asset(
                image,
                height: height * 0.07,
                width: height * 0.07,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.004,
          ),
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                fontSize: height * 0.02,
                color: ProjectColors.kBlackColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DiscountText extends StatelessWidget {
  const DiscountText({
    Key? key,
    required this.height,
    required this.text,
    required this.fontWeight,
    required this.size,
  }) : super(key: key);

  final double height;
  final String text;
  final FontWeight fontWeight;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: kTabBarItemFontStyle.copyWith(
        fontSize: size,
        color: ProjectColors.kWhiteColor,
        fontWeight: fontWeight,
      ),
    );
  }
}

class SecondHeader extends StatelessWidget {
  const SecondHeader({
    Key? key,
    required this.height,
    required this.title,
    required this.icon,
    this.subtitle,
  }) : super(key: key);

  final double height;
  final String title;
  final String? subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: height * 0.028,
          left: height * 0.041,
          child: Center(
            child: Text(
              subtitle ?? '',
              style: TextStyle(
                fontSize: height * 0.012,
                color: ProjectColors.kBlackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              // size: height * 0.040,
            ),
            SizedBox(
              height: height * 0.005,
            ),
            Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: height * 0.015,
                color: ProjectColors.kBlackColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
