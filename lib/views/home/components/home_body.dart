import 'package:cjays/constants/sizes.dart';
import 'package:cjays/controllers/auth/auth.dart';
import 'package:cjays/utils/secure_storage.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  UserSecureStorage userSecureStorage = UserSecureStorage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  AuthController().signInUser();
                },
                child: Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
