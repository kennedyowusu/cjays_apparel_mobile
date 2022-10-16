import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/images.dart';
import 'package:cjays/constants/sizes.dart';
import 'package:cjays/constants/styles.dart';
import 'package:cjays/controllers/category_controller.dart';
import 'package:cjays/controllers/home.dart/home.dart';
import 'package:cjays/controllers/product_controller.dart';
import 'package:cjays/routes/routes_helper.dart';
import 'package:cjays/utils/app_constants.dart';
import 'package:cjays/utils/secure_storage.dart';
import 'package:cjays/views/each_category/each_category.dart';
import 'package:cjays/views/home/components/curve_and_plus_menu.dart';
import 'package:cjays/views/home/components/curve_and_plus_product_card.dart';
import 'package:cjays/views/home/components/discount_text.dart';
import 'package:cjays/views/home/components/second_header.dart';
import 'package:cjays/views/owner_recommend.dart/owner_recommend.dart';
import 'package:cjays/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with TickerProviderStateMixin {
  UserSecureStorage userSecureStorage = UserSecureStorage();

  HomeController homeController = Get.put(HomeController());

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
                        fontSize: 14.0 * kMultiplier * height,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(
                      "Trends".toUpperCase(),
                      style: kTabBarItemFontStyle.copyWith(
                        fontSize: 14.0 * kMultiplier * height,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(
                      "Recommended".toUpperCase(),
                      style: kTabBarItemFontStyle.copyWith(
                        fontSize: 14.0 * kMultiplier * height,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.002,
                vertical: height * 0.002,
              ),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: height * 0.012,
                    ),
                    height: height * 0.78,
                    width: double.infinity,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        ListView.builder(
                          itemCount: 1,
                          itemBuilder: (_, i) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.007,
                                ),
                                Container(
                                  height: height * 0.060,
                                  width: width * 0.94,
                                  padding: EdgeInsets.only(
                                    left: height * 0.012,
                                  ),
                                  margin: EdgeInsets.only(
                                    right: 10,
                                    top: height * 0.007,
                                    bottom: 0,
                                  ),
                                  color: Colors.black,
                                  child: Center(
                                    child: Text(
                                      "Free Delivery Over GH¢ 500",
                                      style: TextStyle(
                                        fontSize: height * 0.016,
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
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.012,
                                  ),
                                  margin: EdgeInsets.only(
                                    right: 10,
                                    top: height * 0.007,
                                    bottom: 0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SecondHeader(
                                        height: height,
                                        title: 'Discounts',
                                        icon: Icons.percent_outlined,
                                      ),
                                      SecondHeader(
                                        height: height,
                                        title: ' Returns',
                                        icon: Icons.calendar_today_outlined,
                                        // subtitle: '30d',
                                      ),
                                      SecondHeader(
                                        height: height,
                                        title: 'Delivery ',
                                        icon: Icons.local_shipping_outlined,
                                      ),
                                      SecondHeader(
                                        height: height,
                                        title: 'E-Pay',
                                        icon: Icons.credit_card_outlined,
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
                                                fontSize: height * 0.016,
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
                                                  fontSize: height * 0.016,
                                                  color:
                                                      ProjectColors.kWhiteColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: 'GH¢ 50.00',
                                                    style: kTabBarItemFontStyle
                                                        .copyWith(
                                                      fontSize: height * 0.018,
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
                                          borderRadius: BorderRadius.circular(
                                            height * 0.003,
                                          ),
                                          border: Border.all(
                                            color: ProjectColors.kWhiteColor,
                                            width: 1.2,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Shop Now".toUpperCase(),
                                            style: TextStyle(
                                              fontSize: height * 0.011,
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
                                        height: height * 0.16,
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
                                            size: height * 0.018,
                                          ),
                                          DiscountText(
                                            height: height,
                                            text: "with",
                                            fontWeight: FontWeight.w600,
                                            size: height * 0.018,
                                          ),
                                          DiscountText(
                                            height: height,
                                            text: "75% off",
                                            fontWeight: FontWeight.bold,
                                            size: height * 0.04,
                                          ),
                                          DiscountText(
                                            height: height,
                                            text: "All Products",
                                            fontWeight: FontWeight.bold,
                                            size: height * 0.018,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.012,
                                ),
                                Text(
                                  "Categories",
                                  style: kTabBarItemFontStyle.copyWith(
                                    fontSize: 14.0 * kMultiplier * height,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.012,
                                ),
                                SizedBox(
                                  height: height * 0.040,
                                  width: width * 0.94,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    children: [
                                      GetBuilder<CategoryController>(
                                        builder: (categoryController) {
                                          return Row(
                                            children: List.generate(
                                              categoryController
                                                  .categoryList.length,
                                              (index) {
                                                return Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: width * 0.01,
                                                  ),
                                                  child: OutlinedButton(
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      side: BorderSide(
                                                        color: ProjectColors
                                                            .kGreyColor,
                                                        width: 1.2,
                                                      ),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          height * 0.003,
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      debugPrint(
                                                        "Category Content is: ${categoryController.categoryList[index].name}",
                                                      );

                                                      Get.to(
                                                        () =>
                                                            EachCategoryScreen(
                                                          category:
                                                              categoryController
                                                                      .categoryList[
                                                                  index],
                                                        ),
                                                      );
                                                    },
                                                    child: Text(
                                                      categoryController
                                                          .categoryList[index]
                                                          .name
                                                          .toString(),
                                                      style:
                                                          kTabBarItemFontStyle
                                                              .copyWith(
                                                        fontSize: 14.0 *
                                                            kMultiplier *
                                                            height,
                                                        color: ProjectColors
                                                            .kBlackColor,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.020,
                                ),
                                Text(
                                  "Featured Products",
                                  style: kTabBarItemFontStyle.copyWith(
                                    fontSize: 14.0 * kMultiplier * height,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                GetBuilder<ProductController>(
                                  builder: (productController) {
                                    return productController.isLoaded
                                        ? ListView.builder(
                                            itemCount: productController
                                                .productList.length,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              if (productController
                                                      .productList[index]
                                                      .isPopular ==
                                                  true) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                    bottom: height * 0.010,
                                                    top: height * 0.010,
                                                  ),
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                      right: height * 0.020,
                                                    ),
                                                    // height: height * 0.12,
                                                    decoration: BoxDecoration(
                                                      color: ProjectColors
                                                          .kGreyColor
                                                          .withOpacity(0.4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        height * 0.003,
                                                      ),
                                                    ),
                                                    child: ListTile(
                                                      leading: Image.network(
                                                        ProjectConstants
                                                                .BASE_URL +
                                                            ProjectConstants
                                                                .UPLOAD_URL +
                                                            productController
                                                                .productList[
                                                                    index]
                                                                .image!,
                                                        height: height * 0.12,
                                                        width: width * 0.15,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      title: Text(
                                                        productController
                                                            .productList[index]
                                                            .name!,
                                                        style:
                                                            kTabBarItemFontStyle
                                                                .copyWith(
                                                          fontSize:
                                                              height * 0.018,
                                                          color: ProjectColors
                                                              .kBlackColor,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      subtitle: Text(
                                                        "GH¢ ${productController.productList[index].price!}"
                                                            .split('.')[0],
                                                        style:
                                                            kTabBarItemFontStyle
                                                                .copyWith(
                                                          fontSize:
                                                              height * 0.018,
                                                          color: ProjectColors
                                                              .kForestGreenColor,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      trailing: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              ProjectColors
                                                                  .kWhiteColor,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            horizontal:
                                                                height * 0.015,
                                                          ),
                                                          side: BorderSide(
                                                            color: ProjectColors
                                                                .kBlackColor,
                                                          ),
                                                          elevation: 0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              height * 0.002,
                                                            ),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          debugPrint(
                                                            productController
                                                                .productList[
                                                                    index]
                                                                .name!,
                                                          );

                                                          Get.toNamed(
                                                            RouteHelper
                                                                .getProductDetailsScreenRoute(
                                                                    index),
                                                          );
                                                        },
                                                        child: Text(
                                                          "View More",
                                                          style:
                                                              kTabBarItemFontStyle
                                                                  .copyWith(
                                                            fontSize:
                                                                height * 0.017,
                                                            color: ProjectColors
                                                                .kBlackColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return SizedBox();
                                              }
                                            },
                                          )
                                        : Center(
                                            child: Loader(),
                                          );
                                  },
                                ),
                              ],
                            );
                          },
                        ),

                        // TRENDS CLOTHES STARTS HERE

                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: height * 0.015,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: height * 0.007,
                                    ),
                                    CurveAndPlusCard(
                                      height: height,
                                      width: width,
                                      title: "Daily Flash Sale",
                                      text: "Up To",
                                      subtitle: "50% Off",
                                      buttonText: "Most liked",
                                      image: ProjectImages.kBeach,
                                    ),
                                    SizedBox(
                                      width: width * 0.05,
                                    ),
                                    CurveAndPlusCard(
                                      height: height,
                                      width: width,
                                      title: "Super Deals",
                                      text: "Starts at",
                                      subtitle: "GH¢30",
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
                                GetBuilder<ProductController>(
                                  builder: (productController) {
                                    return Row(
                                      children: [
                                        CurveAndPlusProductCard(
                                          height: height,
                                          width: width,
                                          percentage: '-19%',
                                          title: "",
                                          image: ProjectConstants.BASE_URL +
                                              ProjectConstants.UPLOAD_URL +
                                              productController
                                                  .productList[0].image!,
                                          newPrice: productController
                                              .productList[0].price!,
                                          oldPrice: ' GH¢100.00',
                                          color: homeController.isFavorite.value
                                              ? ProjectColors.kVenetianRedColor
                                              : ProjectColors.kBlackColor,
                                          icon: homeController.isFavorite.value
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          onTap: () {
                                            debugPrint(
                                              productController
                                                  .productList[0].name!,
                                            );

                                            Get.toNamed(
                                              RouteHelper
                                                  .getProductDetailsScreenRoute(
                                                0,
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          width: width * 0.030,
                                        ),
                                        CurveAndPlusProductCard(
                                          height: height,
                                          width: width,
                                          percentage: '-21%',
                                          title: "",
                                          image: ProjectConstants.BASE_URL +
                                              ProjectConstants.UPLOAD_URL +
                                              productController
                                                  .productList[1].image!,
                                          newPrice: productController
                                              .productList[1].price!,
                                          oldPrice: ' GH¢110.00',
                                          color: homeController.isFavorite.value
                                              ? ProjectColors.kVenetianRedColor
                                              : ProjectColors.kBlackColor,
                                          icon: homeController.isFavorite.value
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          onTap: () {
                                            debugPrint(
                                              productController
                                                  .productList[1].name,
                                            );

                                            Get.toNamed(
                                              RouteHelper
                                                  .getProductDetailsScreenRoute(
                                                1,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: height * 0.004,
                                ),
                                GetBuilder<ProductController>(
                                  builder: (productController) {
                                    return Row(
                                      children: [
                                        CurveAndPlusProductCard(
                                          height: height,
                                          width: width,
                                          percentage: '-21%',
                                          title: "",
                                          image: ProjectConstants.BASE_URL +
                                              ProjectConstants.UPLOAD_URL +
                                              productController
                                                  .productList[2].image!,
                                          newPrice: productController
                                              .productList[2].price!,
                                          oldPrice: ' GH¢140.00',
                                          color: homeController.isFavorite.value
                                              ? ProjectColors.kVenetianRedColor
                                              : ProjectColors.kBlackColor,
                                          icon: homeController.isFavorite.value
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          onTap: () {
                                            debugPrint(
                                              productController
                                                  .productList[2].name,
                                            );

                                            Get.toNamed(
                                              RouteHelper
                                                  .getProductDetailsScreenRoute(
                                                2,
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          width: width * 0.030,
                                        ),
                                        CurveAndPlusProductCard(
                                          height: height,
                                          width: width,
                                          percentage: '-21%',
                                          title: "",
                                          image: ProjectConstants.BASE_URL +
                                              ProjectConstants.UPLOAD_URL +
                                              productController
                                                  .productList[3].image!,
                                          newPrice: productController
                                              .productList[3].price!,
                                          oldPrice: ' GH¢120.00',
                                          color: homeController.isFavorite.value
                                              ? ProjectColors.kVenetianRedColor
                                              : ProjectColors.kBlackColor,
                                          icon: homeController.isFavorite.value
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          onTap: () {
                                            debugPrint(
                                              productController
                                                  .productList[3].name,
                                            );

                                            Get.toNamed(
                                              RouteHelper
                                                  .getProductDetailsScreenRoute(
                                                3,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: height * 0.004,
                                ),
                                SizedBox(
                                  height: height * 0.004,
                                ),
                                GetBuilder<ProductController>(
                                  builder: (productController) {
                                    return Row(
                                      children: [
                                        CurveAndPlusProductCard(
                                          height: height,
                                          width: width,
                                          percentage: '-21%',
                                          title: "",
                                          image: ProjectConstants.BASE_URL +
                                              ProjectConstants.UPLOAD_URL +
                                              productController
                                                  .productList[4].image!,
                                          newPrice: productController
                                              .productList[4].price!,
                                          oldPrice: ' GH¢140.00',
                                          color: homeController.isFavorite.value
                                              ? ProjectColors.kVenetianRedColor
                                              : ProjectColors.kBlackColor,
                                          icon: homeController.isFavorite.value
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          onTap: () {
                                            debugPrint(
                                              productController
                                                  .productList[4].name,
                                            );

                                            Get.toNamed(
                                              RouteHelper
                                                  .getProductDetailsScreenRoute(
                                                4,
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          width: width * 0.030,
                                        ),
                                        CurveAndPlusProductCard(
                                          height: height,
                                          width: width,
                                          percentage: '-21%',
                                          title: "",
                                          image: ProjectConstants.BASE_URL +
                                              ProjectConstants.UPLOAD_URL +
                                              productController
                                                  .productList[5].image!,
                                          newPrice: productController
                                              .productList[5].price!
                                              .split('.')[0],
                                          oldPrice: ' GH¢120.00',
                                          color: homeController.isFavorite.value
                                              ? ProjectColors.kVenetianRedColor
                                              : ProjectColors.kBlackColor,
                                          icon: homeController.isFavorite.value
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          onTap: () {
                                            debugPrint(
                                              productController
                                                  .productList[5].name,
                                            );

                                            Get.toNamed(
                                              RouteHelper
                                                  .getProductDetailsScreenRoute(
                                                5,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: height * 0.004,
                                ),
                                GetBuilder<ProductController>(
                                  builder: (productController) {
                                    return Row(
                                      children: [
                                        CurveAndPlusProductCard(
                                          height: height,
                                          width: width,
                                          percentage: '-21%',
                                          title: "",
                                          image: ProjectConstants.BASE_URL +
                                              ProjectConstants.UPLOAD_URL +
                                              productController
                                                  .productList[6].image!,
                                          newPrice: productController
                                              .productList[6].price!,
                                          oldPrice: ' GH¢140.00',
                                          color: homeController.isFavorite.value
                                              ? ProjectColors.kVenetianRedColor
                                              : ProjectColors.kBlackColor,
                                          icon: homeController.isFavorite.value
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          onTap: () {
                                            debugPrint(
                                              productController
                                                  .productList[6].name,
                                            );

                                            Get.toNamed(
                                              RouteHelper
                                                  .getProductDetailsScreenRoute(
                                                6,
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          width: width * 0.030,
                                        ),
                                        CurveAndPlusProductCard(
                                          height: height,
                                          width: width,
                                          percentage: '-21%',
                                          title: "",
                                          image: ProjectConstants.BASE_URL +
                                              ProjectConstants.UPLOAD_URL +
                                              productController
                                                  .productList[7].image!,
                                          newPrice: productController
                                              .productList[7].price!
                                              .split('.')[0],
                                          oldPrice: ' GH¢120.00',
                                          color: homeController.isFavorite.value
                                              ? ProjectColors.kVenetianRedColor
                                              : ProjectColors.kBlackColor,
                                          icon: homeController.isFavorite.value
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          onTap: () {
                                            debugPrint(
                                              productController
                                                  .productList[7].name,
                                            );

                                            Get.toNamed(
                                              RouteHelper
                                                  .getProductDetailsScreenRoute(
                                                7,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),

                        // Recommended Starts Here
                        OwnerRecommendedProducts(),
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
