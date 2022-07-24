import 'dart:convert';

import 'package:cjays/constants/errors.dart';
import 'package:cjays/constants/sizes.dart';
import 'package:cjays/service/auth/auth.dart';
import 'package:cjays/views/home/home.dart';
import 'package:cjays/widgets/default_button.dart';
import 'package:cjays/widgets/form_errors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String email = '';
  String password = '';
  String name = '';
  String phoneNumber = '';
  String confirmPassword = '';

  AuthService authService = AuthService();

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  createUserAccount() async {
    bool isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    _formKey.currentState!.save();
    http.Response response = await authService.signUpUser(
      name,
      email,
      phoneNumber,
      password,
      confirmPassword,
    );
    Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      Get.offAll(HomeScreen());
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
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors as List<String>),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "continue",
            press: () => createUserAccount(),
          ),
        ],
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(Icons.phone_android_sharp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(10),
          ),
        ),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      onSaved: (newValue) => name = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Full Name",
        hintText: "Enter your full name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(10),
          ),
        ),
      ),
    );
  }
}
