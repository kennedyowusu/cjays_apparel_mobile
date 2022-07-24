import 'dart:convert';

import 'package:cjays/constants/errors.dart';
import 'package:cjays/constants/sizes.dart';
import 'package:cjays/helpers/helpers.dart';
import 'package:cjays/service/auth/auth.dart';
import 'package:cjays/views/auth/forgot_password/forgot_password_screen.dart';
import 'package:cjays/views/auth/sign_success/login_success_screen.dart';
import 'package:cjays/views/home/home.dart';
import 'package:cjays/widgets/default_button.dart';
import 'package:cjays/widgets/form_errors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  AuthService authService = AuthService();

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  loginUser() async {
    bool isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    _formKey.currentState!.save();
    http.Response response = await authService.signInUser(
      email!,
      password!,
    );
    Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      Get.offAll(() => HomeScreen());
    } else {
      addError(error: responseData['error']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot Password",
                style: TextStyle(),
              ),
            ),
          ),
          FormError(errors: errors as List<String>),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              loginUser();
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(10),
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email Address",
        hintText: "Enter your email address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(Icons.alternate_email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(10),
          ),
        ),
      ),
    );
  }
}
