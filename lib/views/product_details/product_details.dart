import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/images.dart';
import 'package:cjays/views/home/home.dart';
import 'package:cjays/widgets/expanded_text.dart';
import 'package:cjays/widgets/medium_text.dart';
import 'package:cjays/widgets/project_icons.dart';
import 'package:cjays/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                height: height * 0.5,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: ProjectColors.kPrimaryColor,
                  image: DecorationImage(
                    image: AssetImage(ProjectImages.kDress),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.025,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => HomeScreen());
                    },
                    child: ProjectIcon(
                      icon: Icons.arrow_back_ios,
                      color: ProjectColors.kWhiteColor,
                    ),
                  ),
                  Stack(
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
                  )
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: height * 0.4,
              child: Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 0,
                ),
                decoration: BoxDecoration(
                  color: ProjectColors.kWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    MediumText(
                      text: 'Dress Name',
                      color: ProjectColors.kBlackColor,
                      size: 20.0,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MediumText(
                      text: "Product Description",
                      size: 15,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableText(
                          text:
                              "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit, tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit, quia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos  sapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam recusandae alias error harum maxime adipisci amet laborum. Perspiciatis  minima nesciunt dolorem! Officiis iure rerum voluptates a cumque velit  quibusdam sed amet tempora. Sit laborum ab, eius fugit doloribus tenetur  fugiat, temporibus enim commodi iusto libero magni deleniti quod quam  consequuntur! Commodi minima excepturi repudiandae velit hic maxime doloremque. Quaerat provident commodi consectetur veniam similique ad  earum omnis ipsum saepe, voluptas, hic voluptates pariatur est explicabo  fugiat, dolorum eligendi quam cupiditate excepturi mollitia maiores labore  suscipit quas? Nulla, placeat. Voluptatem quaerat non architecto ab laudantium modi minima sunt esse temporibus sint culpa, recusandae aliquam numquam  totam ratione voluptas quod exercitationem fuga. Possimus quis earum veniam  quasi aliquam eligendi, placeat qui corporis!",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: height * 0.125,
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0,
            bottom: 30.0,
          ),
          decoration: BoxDecoration(
            color: ProjectColors.kBlackColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
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
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: ProjectColors.kPrimaryColor,
                      radius: 10.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.remove,
                          color: ProjectColors.kWhiteColor,
                          size: 15.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    MediumText(
                      text: "1",
                      size: 15,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(
                      backgroundColor: ProjectColors.kPrimaryColor,
                      radius: 10.0,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.add,
                            color: ProjectColors.kWhiteColor,
                            size: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: height * 0.08,
                    decoration: BoxDecoration(
                      color: ProjectColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: MediumText(
                        text: 'GH¢ 50.00 | Add to Cart',
                        color: ProjectColors.kWhiteColor,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
