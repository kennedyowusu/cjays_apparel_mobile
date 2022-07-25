import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/images.dart';
import 'package:cjays/constants/sizes.dart';
import 'package:cjays/constants/styles.dart';
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
    TabController tabController = TabController(length: 3, vsync: this);
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
                      ),
                    ),
                    Text(
                      "Curve & Plus".toUpperCase(),
                      style: kTabBarItemFontStyle.copyWith(
                        fontSize: 18.0 * kMultiplier * height,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(
                      "Grandmas".toUpperCase(),
                      style: kTabBarItemFontStyle.copyWith(
                        fontSize: 18.0 * kMultiplier * height,
                        letterSpacing: 1.2,
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
                    padding: EdgeInsets.only(
                      left: height * 0.012,
                    ),
                    height: height * 0.75,
                    width: double.infinity,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        ListView.builder(
                          itemCount: 1,
                          itemBuilder: (_, i) {
                            return Column(
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
                                ),
                              ],
                            );
                          },
                        ),
                        // CURVES AND PLUS STARTS HERE

                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: height * 0.005,
                                ),
                                Row(
                                  children: [
                                    CurveAndPlusCard(
                                      height: height,
                                      width: width,
                                      title: "Daily Flash Sale",
                                      text: "Up To",
                                      subtitle: "50% Off",
                                      buttonText: "Buy Most liked",
                                      image: ProjectImages.kBeach,
                                    ),
                                    SizedBox(
                                      width: width * 0.055,
                                    ),
                                    CurveAndPlusCard(
                                      height: height,
                                      width: width,
                                      title: "Super Deals",
                                      text: "Starts at",
                                      subtitle: "GHS30",
                                      buttonText: "Shop Now",
                                      image: ProjectImages.kSea,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.004,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CurvesAndPlusIMenu(
                                      height: height,
                                      pressed: () {},
                                      text: "Tops",
                                    ),
                                    CurvesAndPlusIMenu(
                                      height: height,
                                      text: "Dresses",
                                      pressed: () {},
                                    ),
                                    CurvesAndPlusIMenu(
                                      height: height,
                                      text: "Bottoms",
                                      pressed: () {},
                                    ),
                                    CurvesAndPlusIMenu(
                                      height: height,
                                      text: "Jumpsuits & Rompers",
                                      pressed: () {},
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    CurveAndProductCard(
                                      height: height,
                                      width: width,
                                      percentage: '-21%',
                                      title: 'Curves + Plus',
                                      image: ProjectImages.kCurvy,
                                      newPrice: 'GHS75.00',
                                      oldPrice: ' GHS100.00',
                                    ),
                                    SizedBox(
                                      width: width * 0.055,
                                    ),
                                    CurveAndProductCard(
                                      height: height,
                                      width: width,
                                      percentage: '-21%',
                                      title: 'Curves + Plus',
                                      image: ProjectImages.kCurvyPlus,
                                      newPrice: 'GHS80.00 ',
                                      oldPrice: 'GHS110.00',
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.004,
                                ),
                                Row(
                                  children: [
                                    CurveAndProductCard(
                                      height: height,
                                      width: width,
                                      percentage: '-21%',
                                      title: 'Curves + Plus',
                                      image: ProjectImages.kCurvy,
                                      newPrice: 'GHS110.00',
                                      oldPrice: ' GHS140.00',
                                    ),
                                    SizedBox(
                                      width: width * 0.055,
                                    ),
                                    CurveAndProductCard(
                                      height: height,
                                      width: width,
                                      percentage: '-21%',
                                      title: 'Curves + Plus',
                                      image: ProjectImages.kCurvyPlus,
                                      newPrice: 'GHS90.00 ',
                                      oldPrice: 'GHS120.00',
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),

                        Center(
                          child: Text(
                            "I will figure out what to put here soon"
                                .toUpperCase(),
                            style: kTabBarItemFontStyle.copyWith(
                              fontSize: 18.0 * kMultiplier * height,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.bold,
                              color: ProjectColors.kBlackColor,
                            ),
                          ),
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

class CurveAndProductCard extends StatelessWidget {
  const CurveAndProductCard({
    Key? key,
    required this.height,
    required this.width,
    required this.percentage,
    required this.title,
    required this.oldPrice,
    required this.newPrice,
    required this.image,
  }) : super(key: key);

  final double height;
  final double width;
  final String percentage, title, oldPrice, newPrice, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height * 0.025,
        ),
        Stack(
          children: [
            Container(
              height: height * 0.40,
              width: width * 0.43,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: height * 0.02,
              left: width * 0.02,
              top: height * 0.02,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    height: height * 0.04,
                    width: width * 0.11,
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        percentage,
                        style: kTabBarItemFontStyle.copyWith(
                          color: ProjectColors.kWhiteColor,
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.2,
                  ),
                  CircleAvatar(
                    radius: height * 0.022,
                    backgroundColor: ProjectColors.kWhiteColor,
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: ProjectColors.kBlackColor,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: height * 0.36,
              child: Container(
                height: height * 0.04,
                width: width * 0.43,
                color: ProjectColors.kWhiteColor.withOpacity(0.7),
                child: Center(
                  child: Text(
                    title.toUpperCase(),
                    style: kTabBarItemFontStyle.copyWith(
                      color: ProjectColors.kBlackColor,
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: RichText(
            textScaleFactor: 1.1,
            text: TextSpan(
              text: newPrice,
              style: kTabBarItemFontStyle.copyWith(
                color: ProjectColors.kPrimaryColor,
                fontSize: height * 0.02,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: oldPrice,
                  style: kTabBarItemFontStyle.copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: ProjectColors.kBlackColor,
                    fontSize: height * 0.02,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CurvesAndPlusIMenu extends StatelessWidget {
  const CurvesAndPlusIMenu({
    Key? key,
    required this.height,
    required this.text,
    required this.pressed,
  }) : super(key: key);

  final double height;
  final String text;
  final Function pressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pressed,
      child: Text(
        text,
        style: kTabBarItemFontStyle.copyWith(
          fontSize: 16.0 * kMultiplier * height,
          fontWeight: FontWeight.bold,
          color: ProjectColors.kBlackColor.withOpacity(0.5),
        ),
      ),
    );
  }
}

class CurveAndPlusCard extends StatelessWidget {
  const CurveAndPlusCard({
    Key? key,
    required this.height,
    required this.width,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.text,
    required this.buttonText,
  }) : super(key: key);

  final double height;
  final double width;
  final String image, title, subtitle, text, buttonText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height * 0.4,
          width: width * 0.43,
          decoration: BoxDecoration(
            color: ProjectColors.kGreyColor,
          ),
          child: Image.asset(
            image,
            height: height * 0.4,
            width: width * 0.4,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.06,
            vertical: height * 0.10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: kTabBarItemFontStyle.copyWith(
                  fontSize: height * 0.02,
                  color: ProjectColors.kWhiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: kTabBarItemFontStyle.copyWith(
                  fontSize: height * 0.03,
                  color: ProjectColors.kWhiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                text,
                style: kTabBarItemFontStyle.copyWith(
                  fontSize: height * 0.04,
                  color: ProjectColors.kWhiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * 0.028,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ProjectColors.kPrimaryColor,
                  minimumSize: Size(
                    width * 0.2,
                    height * 0.05,
                  ),
                  padding: EdgeInsets.all(
                    height * 0.01,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      height * 0.01,
                    ),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      buttonText.toUpperCase(),
                      style: kTabBarItemFontStyle.copyWith(
                        fontSize: height * 0.018,
                        color: ProjectColors.kWhiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: ProjectColors.kWhiteColor,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
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
