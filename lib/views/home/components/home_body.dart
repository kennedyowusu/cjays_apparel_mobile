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
                                      "Free Delivery Over GHS 500",
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
                                                    text: 'GHS50.00',
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
                                    fontSize: height * 0.018,
                                    color: ProjectColors.kBlackColor,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.012,
                                ),
                                SizedBox(
                                  height: 20.0,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      GetBuilder<CategoryController>(
                                        builder: (categoryController) {
                                          return Row(
                                            children: List.generate(
                                              categoryController
                                                  .categoryList.length,
                                              (index) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 8.0,
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
                                                      // print the number of items in a category
                                                      // print(categoryController
                                                      //     .categoryList[index]
                                                      //     .items
                                                      //     .length);
                                                      debugPrint(
                                                        "Category Content is: ${categoryController.categoryList[index].id}",
                                                      );

                                                      // print the content of each category
                                                      debugPrint(
                                                        "Category Content is: ${categoryController.categoryList[index].name}",
                                                      );

                                                      // navigate to the category page
                                                      // Navigator.push(
                                                      //   context,
                                                      //   MaterialPageRoute(
                                                      //     builder: (context) =>
                                                      //         EachCategoryScreen(
                                                      //       category:
                                                      //           categoryController
                                                      //                   .categoryList[
                                                      //               index],
                                                      //     ),
                                                      //   ),
                                                      // );

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
                                                        fontSize:
                                                            height * 0.018,
                                                        color: ProjectColors
                                                            .kBlackColor,
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
                                GetBuilder<CategoryController>(
                                  builder: (categoryController) {
                                    return categoryController.isLoaded
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ProductAndText(
                                                height: height,
                                                name: categoryController
                                                    .categoryList[4].name!,
                                                image: ProjectImages.kDress,
                                                width: width,
                                              ),
                                              SizedBox(
                                                width: width * 0.065,
                                              ),
                                              ProductAndText(
                                                height: height,
                                                name: categoryController
                                                    .categoryList[4].name!,
                                                image: ProjectImages.kShirt,
                                                width: width,
                                              ),
                                              SizedBox(
                                                width: width * 0.065,
                                              ),
                                              ProductAndText(
                                                height: height,
                                                name: categoryController
                                                    .categoryList[4].name!,
                                                image: ProjectImages.kShoes,
                                                width: width,
                                              ),
                                              SizedBox(
                                                width: width * 0.065,
                                              ),
                                              ProductAndText(
                                                height: height,
                                                name: "Suitszz",
                                                image: ProjectImages.kSuits,
                                                width: width,
                                              ),
                                            ],
                                          )
                                        : Center(
                                            child: CircularProgressIndicator(
                                              color:
                                                  ProjectColors.kPrimaryColor,
                                            ),
                                          );
                                  },
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                GetBuilder<CategoryController>(
                                  builder: (categoryController) {
                                    return categoryController.isLoaded
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ProductAndText(
                                                height: height,
                                                name: categoryController
                                                    .categoryList[0].name!,
                                                image: ProjectImages.kPajamas,
                                                width: width,
                                              ),
                                              SizedBox(
                                                width: width * 0.065,
                                              ),
                                              ProductAndText(
                                                height: height,
                                                name: categoryController
                                                    .categoryList[1].name!,
                                                image: ProjectImages.kJeans,
                                                width: width,
                                              ),
                                              SizedBox(
                                                width: width * 0.065,
                                              ),
                                              ProductAndText(
                                                height: height,
                                                name: categoryController
                                                    .categoryList[2].name!,
                                                image: ProjectImages.kHeels,
                                                width: width,
                                              ),
                                              SizedBox(
                                                width: width * 0.065,
                                              ),
                                              ProductAndText(
                                                height: height,
                                                name: categoryController
                                                    .categoryList[3].name!,
                                                image: ProjectImages.kBags,
                                                width: width,
                                              ),
                                            ],
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
                                          oldPrice: ' GHS100.00',
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

                                            // Get.toNamed(
                                            //   RouteHelper
                                            //       .getProductDetailsScreenRoute(
                                            //           productController
                                            //               .productList[0].id!),
                                            // );
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
                                          oldPrice: ' GHS110.00',
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
                                            //   Get.toNamed(
                                            //     RouteHelper
                                            //         .getProductDetailsScreenRoute(
                                            //             productController
                                            //                 .productList[1].id!),
                                            //   );
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
                                          oldPrice: ' GHS140.00',
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

                                            // Get.toNamed(
                                            //   RouteHelper
                                            //       .getProductDetailsScreenRoute(
                                            //           productController
                                            //               .productList[2].id!),
                                            // );
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
                                          oldPrice: ' GHS120.00',
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

                                            // Get.toNamed(
                                            //   RouteHelper
                                            //       .getProductDetailsScreenRoute(
                                            //           productController
                                            //               .productList[3].id!),
                                            // );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),

                                SizedBox(
                                  height: height * 0.004,
                                ),

                                // GetBuilder<ProductController>(
                                //   builder: (productController) {
                                //     return Row(
                                //       children: List.generate(
                                //         2,
                                //         (index) => CurveAndPlusProductCard(
                                //           height: height,
                                //           width: width,
                                //           percentage: '-21%',
                                //           title: 'Curves + Plus'.toUpperCase(),
                                //           image: ProjectImages.kCurvyPlus3,
                                //           newPrice: productController
                                //               .productList[index].price,
                                //           oldPrice: 'GHS120.00',
                                //           color: homeController.isFavorite.value
                                //               ? ProjectColors.kVenetianRedColor
                                //               : ProjectColors.kBlackColor,
                                //           icon: homeController.isFavorite.value
                                //               ? Icons.favorite
                                //               : Icons.favorite_border,
                                //         ),
                                //       ),
                                //     );
                                //   },
                                // ),
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
                                          oldPrice: ' GHS140.00',
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

                                            // Get.toNamed(
                                            //   RouteHelper
                                            //       .getProductDetailsScreenRoute(
                                            //           productController
                                            //               .productList[4].id!),
                                            // );
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
                                              .productList[5].price!,
                                          oldPrice: ' GHS120.00',
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

                                            //   Get.toNamed(
                                            //     RouteHelper
                                            //         .getProductDetailsScreenRoute(
                                            //             productController
                                            //                 .productList[5].id!),
                                            //   );
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
                                          oldPrice: ' GHS140.00',
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

                                            // Get.toNamed(
                                            //   RouteHelper
                                            //       .getProductDetailsScreenRoute(
                                            //           productController
                                            //               .productList[6].id!),
                                            // );
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
                                              .productList[7].price!,
                                          oldPrice: ' GHS120.00',
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

                                            // Get.toNamed(
                                            //   RouteHelper
                                            //       .getProductDetailsScreenRoute(
                                            //           productController
                                            //               .productList[7].id
                                            //               ),
                                            // );
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
                        // ListView.builder(
                        //   itemCount: 1,
                        //   itemBuilder: (c, i) {
                        //     return Column(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Text(
                        //           "I will figure out what to put here soon"
                        //               .toUpperCase(),
                        //           style: kTabBarItemFontStyle.copyWith(
                        //             fontSize: 18.0 * kMultiplier * height,
                        //             letterSpacing: 1.2,
                        //             fontWeight: FontWeight.bold,
                        //             color: ProjectColors.kBlackColor,
                        //           ),
                        //         ),
                        //       ],
                        //     );
                        //   },
                        // )
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
