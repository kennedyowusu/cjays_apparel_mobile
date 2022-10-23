import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/styles.dart';
import 'package:cjays/controllers/auth/auth_controller.dart';
import 'package:cjays/controllers/location_controller.dart';
import 'package:cjays/controllers/user_controller.dart';
import 'package:cjays/widgets/project_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  TextEditingController addressController = TextEditingController();
  TextEditingController contactPersonNameController = TextEditingController();
  TextEditingController contactPersonNumberController = TextEditingController();

  late bool isLoggedIn;
  CameraPosition cameraPosition =
      CameraPosition(target: LatLng(0, 0), zoom: 15.0);
  late LatLng initialLatLngPosition;

  @override
  void initState() {
    super.initState();
    isLoggedIn = Get.find<AuthenticationController>().isUserLoggedIn();

    if (isLoggedIn && Get.find<UserController>().userModel == null) {
      Get.find<UserController>().getUserData();
    }
    if (Get.find<LocationController>().addressList.isNotEmpty) {
      cameraPosition = CameraPosition(
          target: LatLng(
              double.parse(
                  Get.find<LocationController>().getAddress["latitude"]),
              double.parse(
                  Get.find<LocationController>().getAddress["longitude"])),
          zoom: 15.0);

      initialLatLngPosition = LatLng(
          double.parse(Get.find<LocationController>().getAddress["latitude"]),
          double.parse(Get.find<LocationController>().getAddress["longitude"]));
    } else {
      initialLatLngPosition = LatLng(0, 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            60.0 * kMultiplier * height,
          ),
          child: AppBar(
            title: Text(
              "Address Info".toUpperCase(),
              style: kTabBarItemFontStyle.copyWith(
                fontSize: 20.0 * kMultiplier * height,
                fontWeight: FontWeight.bold,
                color: ProjectColors.kBlackColor,
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: ProjectColors.kWhiteColor,
            actions: [
              IconButton(
                icon: ProjectIcon(
                  icon: Icons.shopping_bag_outlined,
                  color: ProjectColors.kWhiteColor,
                ),
                onPressed: () {},
              ),
            ],
            centerTitle: true,
            elevation: 0.0,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.002,
          ),
          child: Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: ProjectColors.kWhiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  border: Border.all(
                    color: ProjectColors.kPrimaryColor,
                    width: 0.5,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
