import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/images.dart';
import 'package:cjays/constants/sizes.dart';
import 'package:cjays/constants/styles.dart';
import 'package:cjays/constants/text.dart';
import 'package:cjays/views/auth/signin/sign_in.dart';
import 'package:cjays/views/onboarding/components/content.dart';
import 'package:cjays/widgets/default_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreenBody extends StatefulWidget {
  const OnboardingScreenBody({Key? key}) : super(key: key);

  @override
  _OnboardingScreenBodyState createState() => _OnboardingScreenBodyState();
}

class _OnboardingScreenBodyState extends State<OnboardingScreenBody> {
  int currentPage = 0;
  List<Map<String, String>> onboardingData = [
    {
      "text": ProjectText.kOnboardScreenFirstMessage,
      "image": ProjectImages.shoppingApp,
    },
    {
      "text": ProjectText.kOnboardScreenSecondMessage,
      "image": ProjectImages.shopping,
    },
    {
      "text": ProjectText.kOnboardScreenThirdMessage,
      "image": ProjectImages.orderConfirmed,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) => OnboardingContent(
                  image: onboardingData[index]["image"],
                  text: onboardingData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onboardingData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? ProjectColors.kPrimaryColor
            : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
