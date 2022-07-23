import 'package:cjays/constants/sizes.dart';
import 'package:cjays/constants/text.dart';
import 'package:cjays/views/auth/signin/components/login_form.dart';
import 'package:cjays/views/auth/signup/sign_up_screen.dart';
import 'package:cjays/widgets/no_account_text.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.orientation == Orientation.portrait
                      ? SizeConfig.screenHeight * 0.04
                      : SizeConfig.screenHeight * 0.03,
                ),
                Text(
                  ProjectText.kLoginScreenText,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
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
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                NoAccountText(
                  text: "Don't have an account? ",
                  actionText: "Sign Up",
                  onTap: () => Navigator.pushNamed(
                    context,
                    SignUpScreen.routeName,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.orientation == Orientation.portrait
                      ? SizeConfig.screenHeight * 0.00
                      : SizeConfig.screenHeight * 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
