import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/images.dart';
import 'package:cjays/widgets/expanded_text.dart';
import 'package:cjays/widgets/medium_text.dart';
import 'package:cjays/widgets/project_icons.dart';
import 'package:cjays/widgets/small_text.dart';
import 'package:flutter/material.dart';

class RecommendationsScreen extends StatelessWidget {
  const RecommendationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                    onPressed: () {},
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
                    child: MediumText(text: "Dress Name Here"),
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
                      image: AssetImage(ProjectImages.kDress),
                      fit: BoxFit.cover,
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
                      text:
                          "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit, tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit, quia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos  sapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam recusandae alias error harum maxime adipisci amet laborum. Perspiciatis  minima nesciunt dolorem! Officiis iure rerum voluptates a cumque velit  quibusdam sed amet tempora. Sit laborum ab, eius fugit doloribus tenetur  fugiat, temporibus enim commodi iusto libero magni deleniti quod quam  consequuntur! Commodi minima excepturi repudiandae velit hic maxime doloremque. Quaerat provident commodi consectetur veniam similique ad  earum omnis ipsum saepe, voluptas, hic voluptates pariatur est explicabo  fugiat, dolorum eligendi quam cupiditate excepturi mollitia maiores labore  suscipit quas? Nulla, placeat. Voluptatem quaerat non architecto ab laudantium modi minima sunt esse temporibus sint culpa, recusandae aliquam numquam  totam ratione voluptas quod exercitationem fuga. Possimus quis earum veniam  quasi aliquam eligendi, placeat qui corporis!",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Column(
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
                    text: "10"
                        " X "
                        " GH¢ 5",
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
                            text: 'GH¢ 50.00 | Add to Cart',
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
        ),
      ),
    );
  }
}
