import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/images.dart';
import 'package:cjays/constants/sizes.dart';
import 'package:cjays/constants/text.dart';
import 'package:cjays/controllers/cart_controller.dart';
import 'package:cjays/controllers/category_controller.dart';
import 'package:cjays/controllers/product_controller.dart';
import 'package:cjays/controllers/recommended_controller.dart';
import 'package:cjays/routes/routes_helper.dart';
import 'package:cjays/utils/secure_storage.dart';
import 'package:cjays/views/home/home.dart';
import 'package:cjays/views/onboarding/onboarding.dart';
import 'package:cjays/widgets/refresher.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> position;
  late Animation<double> _opacity;

  final UserSecureStorage userSecureStorage = UserSecureStorage();

  String emailAddress = "";

  @override
  void initState() {
    super.initState();
    loadResources();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    position = Tween<double>(begin: 20, end: 50).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, 1)),
    )..addListener(() {
        setState(() {});
      });

    _opacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: controller, curve: Interval(.5, 1)),
    )..addListener(() {
        setState(() {});
      });
    // Always repeat animation
    controller.repeat();

    userSecureStorage.readSecureData('email').then((value) {
      emailAddress = value ?? "";
    });
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 5),
              Container(
                padding: EdgeInsets.only(
                  top: SizeConfig.orientation == Orientation.portrait
                      ? size.height * .02
                      : size.height * .05,
                ),
                height: size.height / 2.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: SizeConfig.orientation == Orientation.portrait
                          ? width * 0.2
                          : width * .3,
                      height: SizeConfig.orientation == Orientation.portrait
                          ? height * 0.2
                          : height * 0.23,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: ProjectColors.kPrimaryColor,
                          width: SizeConfig.orientation == Orientation.portrait
                              ? width * 0.01
                              : width * 0.005,
                        ),
                      ),
                      child: Center(
                        child: Hero(
                          tag: "logo",
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5),
                              BlendMode.modulate,
                            ),
                            child: Image.asset(
                              ProjectImages.kCart,
                              height: size.height / 6.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.orientation == Orientation.portrait
                          ? height * 0.01
                          : height * 0.02,
                    ),
                    Text(
                      ProjectText.kAppName,
                      style: TextStyle(
                        fontSize: SizeConfig.orientation == Orientation.portrait
                            ? width * .04
                            : width * .04,
                        fontWeight: FontWeight.bold,
                        color: ProjectColors.kPrimaryColor,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.orientation == Orientation.portrait
                          ? height * 0.01
                          : height * 0.01,
                    ),
                    SizeConfig.orientation == Orientation.portrait
                        ? RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(),
                          )
                        : RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text:
                                  "Elegance, gorgeous & fashionable\ncollection makes you cool",
                              style: TextStyle(
                                color:
                                    ProjectColors.kBlackColor.withOpacity(0.5),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                  ],
                ),
              ),
              Spacer(),
              Spacer(flex: 5),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Get.offNamed(
                        RouteHelper.getInitialRoute(),
                      );
                      // Navigator.push(
                      //   context,
                      //   PageTransition(
                      //     type: PageTransitionType.rightToLeft,
                      //     child: emailAddress == " "
                      //         ? OnboardingScreen()
                      //         : HomeScreen(),
                      //   ),
                      // );
                    },
                    onVerticalDragUpdate: (details) {
                      int sensitivity = 8;
                      if (details.delta.dy < -sensitivity) {
                        Get.offNamed(
                          RouteHelper.getInitialRoute(),
                        );
                        // Navigator.push(
                        //   context,
                        //   PageTransition(
                        //     type: PageTransitionType.rightToLeft,
                        //     child: emailAddress == " "
                        //         ? OnboardingScreen()
                        //         : HomeScreen(),
                        //   ),
                        // );
                      }
                    },
                    child: AbsorbPointer(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              bottom:
                                  SizeConfig.orientation == Orientation.portrait
                                      ? height * 0.02
                                      : height * 0.01,
                            ),
                            child: Opacity(
                              opacity: _opacity.value,
                              child: Icon(
                                CommunityMaterialIcons.chevron_double_up,
                                color: ProjectColors.kPrimaryColor,
                                size: 50,
                              ),
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              text: "Get Started",
                              style: TextStyle(
                                color: ProjectColors.kPrimaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
