import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/sizes.dart';
import 'package:cjays/constants/styles.dart';
import 'package:cjays/views/auth/signin/sign_in.dart';
import 'package:cjays/widgets/no_account_text.dart';
import 'package:flutter/material.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text("Register Account", style: headingStyle),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignUpForm(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // children: [
                  //   SocialCard(
                  //     icon: ProjectIcons.googleIcon,
                  //     press: () {},
                  //   ),
                  //   SocialCard(
                  //     icon: ProjectIcons.facebookIcon,
                  //     press: () {},
                  //   ),
                  //   SocialCard(
                  //     icon: ProjectIcons.twitterIcon,
                  //     press: () {},
                  //   ),
                  // ],
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                SizeConfig.orientation == Orientation.portrait
                    ? Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "By continuing, you confirm that you agree \n with our ",
                                style: TextStyle(
                                  color: ProjectColors.kBlackColor
                                      .withOpacity(0.6),
                                ),
                              ),
                              TextSpan(
                                text: "Terms",
                                style: TextStyle(
                                  color: ProjectColors.kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: " & ",
                                style: TextStyle(
                                  color: ProjectColors.kBlackColor
                                      .withOpacity(0.6),
                                ),
                              ),
                              TextSpan(
                                text: "Conditions",
                                style: TextStyle(
                                  color: ProjectColors.kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Text(
                        'By continuing, you confirm that you agree with our Term and Condition',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ProjectColors.kBlackColor.withOpacity(0.6),
                          fontSize: SizeConfig.screenHeight * 0.04,
                        ),
                      ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                NoAccountText(
                  text: "Already have an account? ",
                  actionText: "Login",
                  onTap: () => Navigator.pushNamed(
                    context,
                    LoginScreen.routeName,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
