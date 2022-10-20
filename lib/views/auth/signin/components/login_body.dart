import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/images.dart';
import 'package:cjays/constants/sizes.dart';
import 'package:cjays/constants/text.dart';
import 'package:cjays/views/auth/signin/components/login_form.dart';
import 'package:cjays/views/auth/signup/sign_up_screen.dart';
import 'package:cjays/widgets/custom_suffix_icon.dart';
import 'package:cjays/widgets/input_field.dart';
import 'package:cjays/widgets/no_account_text.dart';
import 'package:cjays/widgets/project_dimensions.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.04),
                Center(
                  child: Container(
                    width: width * 0.35,
                    height: height * 0.2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ProjectColors.kPrimaryColor,
                        width: width * 0.01,
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
                ),
                // InputField(
                //   labelText: "Email Address",
                //   hintText: "Enter your email address",
                //   icon: Icons.email,
                // ),
                // SizedBox(height: size.height * 0.002),
                // InputField(
                //   labelText: "Password",
                //   hintText: "Enter your password",
                //   icon: Icons.email,
                // ),
                SizedBox(height: size.height * 0.002),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
