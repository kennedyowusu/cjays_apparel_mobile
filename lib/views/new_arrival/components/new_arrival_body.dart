import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/images.dart';
import 'package:cjays/constants/styles.dart';
import 'package:cjays/views/new_arrival/components/items_model.dart';
import 'package:cjays/views/new_arrival/components/second_header_content.dart';
import 'package:flutter/material.dart';

class NewArrivalBody extends StatelessWidget {
  NewArrivalBody({Key? key}) : super(key: key);

  List<ItemsModel> items = [
    ItemsModel(image: ProjectImages.kDress1, price: 180.00),
    ItemsModel(image: ProjectImages.kDress2, price: 150.00),
    ItemsModel(image: ProjectImages.kDress3, price: 170.00),
    ItemsModel(image: ProjectImages.kDress5, price: 110.00),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: height * 0.007),
        Row(
          children: [
            Container(
              height: height * 0.16,
              width: width * 0.38,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ProjectColors.kPrimaryColor,
                    ProjectColors.kSecondaryColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New".toUpperCase(),
                    style: kTabBarItemFontStyle.copyWith(
                      fontSize: 20.0 * kMultiplier * height,
                      fontWeight: FontWeight.bold,
                      color: ProjectColors.kWhiteColor,
                    ),
                  ),
                  Text(
                    "Arrivals".toUpperCase(),
                    style: kTabBarItemFontStyle.copyWith(
                      fontSize: 20.0 * kMultiplier * height,
                      fontWeight: FontWeight.bold,
                      color: ProjectColors.kWhiteColor,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              ProjectImages.kNewArrival,
              width: width * 0.58,
              height: height * 0.16,
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
        SizedBox(height: height * 0.007),
        // Row(
        //   children: [
        //     Container(
        //       height: height * 0.10,
        //       width: width * 0.96,
        //       decoration: BoxDecoration(
        //         color: ProjectColors.kBlackColor,
        //         border: Border.all(
        //           color: ProjectColors.kBlackColor.withOpacity(0.5),
        //           width: 0.1,
        //         ),
        //       ),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           // Container(
        //           //   height: height * 0.10,
        //           //   decoration: BoxDecoration(
        //           //     color: ProjectColors.kWhiteColor,
        //           //     border: Border.all(
        //           //       color: ProjectColors.kWhiteColor,
        //           //       width: 0.1,
        //           //     ),
        //           //   ),
        //           //   child: SecondHeaderContent(
        //           //     height: height,
        //           //     width: width,
        //           //     day: 'Today',
        //           //     total: '35',
        //           //     text: 'New Arrivals',
        //           //     color: ProjectColors.kBlackColor,
        //           //   ),
        //           // ),
        //           SecondHeaderContent(
        //             height: height,
        //             width: width,
        //             day: '07/06',
        //             total: '35',
        //             text: 'New Arrivals',
        //             color: ProjectColors.kWhiteColor.withOpacity(0.7),
        //           ),
        //           SecondHeaderContent(
        //             height: height,
        //             width: width,
        //             day: '14/08',
        //             total: '35',
        //             text: 'New Arrivals',
        //             color: ProjectColors.kWhiteColor.withOpacity(0.7),
        //           ),
        //           // SecondHeaderContent(
        //           //   height: height,
        //           //   width: width,
        //           //   day: '04/11',
        //           //   total: '35',
        //           //   text: 'New Arrivals',
        //           //   color: ProjectColors.kWhiteColor.withOpacity(0.7),
        //           // ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        SizedBox(height: height * 0.007),
        SizedBox(
          height: height * 0.68,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (context, index) {
              return SizedBox(width: width * 0.03);
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: height * 0.28,
                            width: width * 0.38,
                            child: Row(
                              children: [
                                Image.asset(
                                  items[index].image,
                                  fit: BoxFit.cover,
                                  width: width * 0.36,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height * 0.009),
                          Text(
                            "GHS${items[index].price}",
                            style: kTabBarItemFontStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.007),
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: height * 0.28,
                            width: width * 0.38,
                            child: Row(
                              children: [
                                Image.asset(
                                  items[index].image,
                                  fit: BoxFit.cover,
                                  width: width * 0.36,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height * 0.009),
                          Text(
                            "GHS${items[index].price}",
                            style: kTabBarItemFontStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
