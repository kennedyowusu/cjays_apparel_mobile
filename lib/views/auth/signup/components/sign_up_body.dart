import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/images.dart';
import 'package:cjays/constants/sizes.dart';
import 'package:cjays/controllers/auth/auth_controller.dart';
import 'package:cjays/models/auth.dart';
import 'package:cjays/routes/routes_helper.dart';
import 'package:cjays/views/auth/signin/sign_in.dart';
import 'package:cjays/widgets/already_have_account.dart';
import 'package:cjays/widgets/auth_button.dart';
import 'package:cjays/widgets/display_message.dart';
import 'package:cjays/widgets/input_field.dart';
import 'package:cjays/widgets/loader.dart';
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
      width: double.maxFinite,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: GetBuilder<AuthenticationController>(
          builder: (authController) {
            return !authController.isLoading
                ? SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
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
                          SizedBox(height: ProjectDimensions.heightTen / 8),
                          InputField(
                            controller: phoneController,
                            labelText: "Phone Number",
                            hintText: "Enter your phone number",
                            icon: Icons.phone_android_sharp,
                          ),
                          SizedBox(height: ProjectDimensions.heightTen / 8),
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
                          InputField(
                            isPassword: true,
                            controller: confirmPasswordController,
                            labelText: "Confirm Password",
                            hintText: "confirm your password",
                            icon: Icons.password,
                          ),
                          SizedBox(height: ProjectDimensions.heightTen / 8),
                          AuthButton(
                            width: width,
                            height: height,
                            text: "Register",
                            onPressed: () {
                              registerUser(authController);
                            },
                          ),
                          SizedBox(height: ProjectDimensions.heightTen / 5),
                          AlreadyHaveAccount(
                            text: "Already have an account?",
                            subText: "Sign In",
                            onPressed: () {
                              Get.to(
                                () => LoginScreen(),
                                transition: Transition.leftToRight,
                              );
                            },
                          ),
                          SizedBox(height: ProjectDimensions.heightTen / 5),
                          Wrap(
                            children: List.generate(
                              3,
                              (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: ProjectColors.kGreyColor,
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
                  )
                : Center(
                    child: Loader(),
                  );
          },
        ),
      ),
    );
  }

  void registerUser(AuthenticationController authController) {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty) {
      displayCustomSnackBar(title: "Full Name", "Full Name is required");
      return;
    } else if (phone.isEmpty) {
      displayCustomSnackBar(title: "Phone Number", "Phone Number is required");
      return;
    } else if (email.isEmpty) {
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
    } else if (confirmPassword.isEmpty) {
      displayCustomSnackBar(
          title: "Password Confirmation", "Confirm Your Password");
      return;
    } else if (password != confirmPassword) {
      displayCustomSnackBar(
          title: "Password Confirmation", "Passwords do not match");
      return;
    } else {
      AuthModel authModel = AuthModel(
        name: name,
        email: email,
        phone: phone,
        password: password,
        confirmPassword: confirmPassword,
      );
      authController.registration(authModel).then((status) {
        if (status.isSuccess) {
          Get.offNamed(
            RouteHelper.getInitialRoute(),
          );
          debugPrint(authModel.toString());
        } else {
          displayCustomSnackBar(status.message);
        }
      });
    }
  }
}
