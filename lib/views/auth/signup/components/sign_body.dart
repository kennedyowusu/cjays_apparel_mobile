import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/images.dart';
import 'package:cjays/constants/sizes.dart';
import 'package:cjays/views/auth/signin/sign_in.dart';
import 'package:cjays/widgets/input_field.dart';
import 'package:cjays/widgets/medium_text.dart';
import 'package:cjays/widgets/project_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  List<String> registerImages = [
    "assets/icons/facebook-2.svg",
    "assets/icons/google-icon.svg",
    "assets/icons/twitter.svg"
  ];

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
          physics: BouncingScrollPhysics(),
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
                        width: 1,
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
                InputField(
                  controller: nameController,
                  labelText: "Full Name",
                  hintText: "Enter your full name",
                  icon: Icons.person,
                ),
                SizedBox(height: size.height * 0.002),
                InputField(
                  controller: phoneController,
                  labelText: "Phone Number",
                  hintText: "Enter your phone number",
                  icon: Icons.phone_android_sharp,
                ),
                SizedBox(height: size.height * 0.002),
                InputField(
                  controller: emailController,
                  labelText: "Email Address",
                  hintText: "Enter your email address",
                  icon: Icons.email,
                ),
                SizedBox(height: size.height * 0.002),
                InputField(
                  controller: passwordController,
                  labelText: "Password",
                  hintText: "Enter your password",
                  icon: Icons.lock,
                ),
                SizedBox(height: size.height * 0.002),
                InputField(
                  controller: confirmPasswordController,
                  labelText: "Confirm Password",
                  hintText: "confirm your password",
                  icon: Icons.lock,
                ),
                SizedBox(height: size.height * 0.002),
                Container(
                  margin: EdgeInsets.only(
                    top: ProjectDimensions.heightTen * 2.5,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ProjectColors.kPrimaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(width, height * 0.06),
                      // maximumSize: Size(width * 0.8, height * 0.06),
                    ),
                    onPressed: () {},
                    child: MediumText(
                      text: "Register",
                      color: ProjectColors.kWhiteColor,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.002),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MediumText(
                      text: "Already have an account?",
                      color: ProjectColors.kBlackColor,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(
                          () => LoginScreen(),
                        );
                      },
                      child: MediumText(
                        text: "Login",
                        color: ProjectColors.kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.002),
                Wrap(
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: ProjectColors.kGreyColor,
                        // backgroundImage: AssetImage(
                        //   registerImages[index],
                        // ),
                        child: SvgPicture.asset(
                          registerImages[index],
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.009),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
