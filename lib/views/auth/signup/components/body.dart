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
                Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignUpForm(),
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
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
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
