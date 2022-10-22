import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/images.dart';
import 'package:cjays/constants/sizes.dart';
import 'package:cjays/constants/text.dart';
import 'package:cjays/controllers/auth/auth_controller.dart';
import 'package:cjays/models/sign_in.dart';
import 'package:cjays/routes/routes_helper.dart';
import 'package:cjays/views/auth/signup/sign_up_screen.dart';
import 'package:cjays/widgets/already_have_account.dart';
import 'package:cjays/widgets/auth_button.dart';
import 'package:cjays/widgets/display_message.dart';
import 'package:cjays/widgets/input_field.dart';
import 'package:cjays/widgets/loader.dart';
import 'package:cjays/widgets/project_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginBody extends StatelessWidget {
  LoginBody({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: GetBuilder<AuthenticationController>(
            builder: (authenticationController) {
              return !authenticationController.isLoading
                  ? SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            SizedBox(height: size.height * 0.04),
                            Text(
                              ProjectText.kWelcomeBack,
                              style: TextStyle(
                                color: ProjectColors.kBlackColor,
                                fontSize: ProjectDimensions.textSizeEighteen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            Text(
                              ProjectText.kSignInToContinue,
                              style: TextStyle(
                                color: ProjectColors.kBlackColor,
                                fontSize: ProjectDimensions.textSizeFifteen,
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            InputField(
                              controller: emailController,
                              labelText: "Email Address",
                              hintText: "Enter your email address",
                              icon: Icons.email,
                            ),
                            SizedBox(height: ProjectDimensions.heightTen / 8),
                            InputField(
                              isPassword: true,
                              controller: passwordController,
                              labelText: "Password",
                              hintText: "Enter your password",
                              icon: Icons.password,
                            ),
                            SizedBox(height: ProjectDimensions.heightTen / 8),
                            AuthButton(
                              width: width,
                              height: height,
                              text: "Sign In",
                              onPressed: () {
                                loginUser(
                                  authenticationController,
                                );
                              },
                            ),
                            SizedBox(height: ProjectDimensions.heightTen / 5),
                            AlreadyHaveAccount(
                              text: "Don't have an account?",
                              subText: "Sign Up",
                              onPressed: () {
                                Get.to(
                                  () => RegisterScreen(),
                                  transition: Transition.rightToLeft,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  : Loader();
            },
          )),
    );
  }

  void loginUser(AuthenticationController authController) {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty) {
      displayCustomSnackBar(
          title: "Email Address", "Email Address is required");
      return;
    } else if (!GetUtils.isEmail(email)) {
      displayCustomSnackBar(
        title: "Invalid Email Address",
        "Enter valid Email Address",
      );
    } else if (password.isEmpty) {
      displayCustomSnackBar(title: "Password", "Password is required");
      return;
    } else if (password.length < 6) {
      displayCustomSnackBar(
          title: "Password Length", "Password must be at least 6 characters");
    } else {
      SignInModel signInModel = SignInModel(
        email: email,
        password: password,
      );
      authController.loginUser(signInModel).then(
        (status) {
          if (status.isSuccess) {
            debugPrint("Registration Successful");
            Get.offNamed(
              RouteHelper.getInitialRoute(),
            );
          } else {
            displayCustomSnackBar(status.message);
            debugPrint("Registration Failed");
          }
        },
      );
    }
  }
}
