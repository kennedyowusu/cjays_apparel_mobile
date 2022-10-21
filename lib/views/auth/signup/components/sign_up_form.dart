// import 'dart:convert';

// import 'package:cjays/constants/errors.dart';
// import 'package:cjays/constants/sizes.dart';
// import 'package:cjays/controllers/auth/auth.dart';
// import 'package:cjays/widgets/default_button.dart';
// import 'package:cjays/widgets/form_errors.dart';
// import 'package:flutter/material.dart';

// class SignUpForm extends StatefulWidget {
//   const SignUpForm({Key? key}) : super(key: key);

//   @override
//   _SignUpFormState createState() => _SignUpFormState();
// }

// class _SignUpFormState extends State<SignUpForm> {
//   final _formKey = GlobalKey<FormState>();

//   bool isLoading = false;

//   final List<String?> errors = [];
//   AuthController authController = AuthController();

//   void addError({String? error}) {
//     if (!errors.contains(error))
//       setState(() {
//         errors.add(error);
//       });
//   }

//   void removeError({String? error}) {
//     if (errors.contains(error))
//       setState(() {
//         errors.remove(error);
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildNameFormField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildPhoneNumberFormField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildEmailFormField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildPasswordFormField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildConformPassFormField(),
//           FormError(errors: errors as List<String>),
//           SizedBox(height: getProportionateScreenHeight(40)),
//           DefaultButton(
//             text: "Continue",
//             press: () {
//               if (_formKey.currentState!.validate()) {
//                 _formKey.currentState!.save();
//                 authController.createUserAccount();
//               }
//               return null;
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   TextFormField buildNameFormField() {
//     return TextFormField(
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       onSaved: (newValue) => authController.name = newValue!,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kNamelNullError);
//         }
//         return;
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kNamelNullError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Full Name",
//         hintText: "Enter your full name",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         prefixIcon: Icon(Icons.person),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(
//             getProportionateScreenWidth(10),
//           ),
//         ),
//       ),
//     );
//   }

//   TextFormField buildPhoneNumberFormField() {
//     return TextFormField(
//       keyboardType: TextInputType.phone,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       onSaved: (newValue) => authController.phone = newValue!,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kPhoneNumberNullError);
//         }
//         return;
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kPhoneNumberNullError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Phone Number",
//         hintText: "Enter your phone number",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         prefixIcon: Icon(Icons.phone_android_sharp),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(
//             getProportionateScreenWidth(10),
//           ),
//         ),
//       ),
//     );
//   }

//   TextFormField buildConformPassFormField() {
//     return TextFormField(
//       obscureText: true,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       onSaved: (newValue) => authController.confirmPassword = newValue!,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kPassNullError);
//         } else if (value.isNotEmpty &&
//             authController.password == authController.confirmPassword) {
//           removeError(error: kMatchPassError);
//         }
//         authController.confirmPassword = value;
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kPassNullError);
//           return "";
//         } else if ((authController.password != value)) {
//           addError(error: kMatchPassError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Confirm Password",
//         hintText: "Re-enter your password",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         prefixIcon: Icon(Icons.lock),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(
//             getProportionateScreenWidth(10),
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(
//             getProportionateScreenWidth(10),
//           ),
//         ),
//       ),
//     );
//   }

//   TextFormField buildPasswordFormField() {
//     return TextFormField(
//       obscureText: true,
//       onSaved: (newValue) => authController.password = newValue!,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kPassNullError);
//         } else if (value.length >= 8) {
//           removeError(error: kShortPassError);
//         }
//         authController.password = value;
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kPassNullError);
//           return "";
//         } else if (value.length < 8) {
//           addError(error: kShortPassError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Password",
//         hintText: "Enter your password",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         prefixIcon: Icon(Icons.lock),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(
//             getProportionateScreenWidth(10),
//           ),
//         ),
//       ),
//     );
//   }

//   TextFormField buildEmailFormField() {
//     return TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       onSaved: (newValue) => authController.email = newValue!,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kEmailNullError);
//         } else if (emailValidatorRegExp.hasMatch(value)) {
//           removeError(error: kInvalidEmailError);
//         }
//         return;
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kEmailNullError);
//           return "";
//         } else if (!emailValidatorRegExp.hasMatch(value)) {
//           addError(error: kInvalidEmailError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Email Address",
//         hintText: "Enter your email",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         prefixIcon: Icon(Icons.alternate_email),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(
//             getProportionateScreenWidth(10),
//           ),
//         ),
//       ),
//     );
//   }
// }
