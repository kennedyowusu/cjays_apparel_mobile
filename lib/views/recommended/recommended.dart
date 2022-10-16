// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cjays/controllers/product_controller.dart';
import 'package:cjays/models/Product.dart';
import 'package:cjays/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cjays/constants/colors.dart';
import 'package:cjays/routes/routes_helper.dart';
import 'package:cjays/widgets/expanded_text.dart';
import 'package:cjays/widgets/medium_text.dart';
import 'package:cjays/widgets/project_icons.dart';
import 'package:cjays/widgets/small_text.dart';

class RecommendationsScreen extends StatelessWidget {
  final int screenId;

  const RecommendationsScreen({
    Key? key,
    required this.screenId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Product recommendedData =
        Get.find<ProductController>().productList[screenId];

    debugPrint('screenId: $screenId');
    debugPrint('recommended Data: ${recommendedData.name}');

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 80.0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: CircleAvatar(
                      radius: 20.0,
                      backgroundColor: ProjectColors.kSecondaryColor,
                      child: ProjectIcon(
                        icon: Icons.close,
                        color: ProjectColors.kWhiteColor,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(RouteHelper.home);
                    },
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Stack(
                      children: [
                        ProjectIcon(
                          icon: Icons.shopping_bag_outlined,
                          color: ProjectColors.kWhiteColor,
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: ProjectIcon(
                            icon: Icons.circle,
                            size: 20.0,
                            color: Colors.transparent,
                            backgroundColor: ProjectColors.kWhiteColor,
                          ),
                        ),
                        Positioned(
                          top: 3,
                          right: 5,
                          child: SmallText(
                            text: '0',
                            color: ProjectColors.kPrimaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  width: double.maxFinite,
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: MediumText(text: recommendedData.name!),
                  ),
                ),
              ),
              expandedHeight: 300,
              backgroundColor: ProjectColors.kPrimaryColor,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: height * 0.5,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: ProjectColors.kPrimaryColor,
                    image: DecorationImage(
                      image: NetworkImage(
                        ProjectConstants.BASE_URL +
                            ProjectConstants.UPLOAD_URL +
                            recommendedData.image!,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      bottom: 20.0,
                    ),
                    child: ExpandableText(
                      text: recommendedData.description!,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: GetBuilder<ProductController>(
          builder: (productController) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: height * 0.125,
                    vertical: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: CircleAvatar(
                          radius: 20.0,
                          backgroundColor: ProjectColors.kSecondaryColor,
                          child: Icon(
                            Icons.remove,
                            color: ProjectColors.kWhiteColor,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      MediumText(
                        text: "0"
                                " X "
                                "GH₵ ${recommendedData.price}"
                            .split('.')[0],
                        color: ProjectColors.kBlackColor,
                        size: 15.0,
                      ),
                      IconButton(
                        icon: CircleAvatar(
                          radius: 20.0,
                          backgroundColor: ProjectColors.kSecondaryColor,
                          child: Icon(
                            Icons.add,
                            color: ProjectColors.kWhiteColor,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height * 0.14,
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 20.0,
                    bottom: 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: ProjectColors.kBlackColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        20.0,
                      ),
                      topRight: Radius.circular(
                        20.0,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height * 0.08,
                        width: width * 0.26,
                        decoration: BoxDecoration(
                          color: ProjectColors.kWhiteColor,
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite_sharp,
                            color: ProjectColors.kVenetianRedColor,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            height: height * 0.08,
                            decoration: BoxDecoration(
                              color: ProjectColors.kPrimaryColor,
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            child: Center(
                              child: MediumText(
                                text:
                                    'GH¢ ${recommendedData.price} | Add to Cart',
                                color: ProjectColors.kWhiteColor,
                                size: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
