import 'package:cjays/constants/colors.dart';
import 'package:cjays/constants/styles.dart';
import 'package:cjays/controllers/auth/auth_controller.dart';
import 'package:cjays/controllers/location_controller.dart';
import 'package:cjays/controllers/user_controller.dart';
import 'package:cjays/widgets/input_field.dart';
import 'package:cjays/widgets/medium_text.dart';
import 'package:cjays/widgets/project_dimensions.dart';
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
  late LatLng initialLatLngPosition = LatLng(0, 0);

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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.02,
            ),
            child: GetBuilder<UserController>(
              builder: (userController) {
                if (contactPersonNameController.text.isEmpty) {
                  contactPersonNameController.text =
                      userController.userModel.name ?? '';
                  contactPersonNumberController.text =
                      userController.userModel.phone ?? '';

                  if (Get.find<LocationController>().addressList.isNotEmpty) {
                    addressController.text = Get.find<LocationController>()
                        .getUserAddress()
                        .address!;
                  }
                }

                return GetBuilder<LocationController>(
                  builder: (locationController) {
                    addressController.text =
                        '${locationController.placeMark.name} ?? '
                        ' ${locationController.placeMark.subLocality} ?? '
                        ' ${locationController.placeMark.locality} ?? '
                        ' ${locationController.placeMark.subAdministrativeArea} ?? '
                        ' ${locationController.placeMark.administrativeArea} ?? '
                        ' ${locationController.placeMark.postalCode} ?? '
                        ' ${locationController.placeMark.country} ?? '
                        '';

                    debugPrint('my address is: ${addressController.text}');

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          child: Stack(
                            children: [
                              GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: initialLatLngPosition,
                                  zoom: 15.0,
                                ),
                                zoomControlsEnabled: false,
                                compassEnabled: false,
                                indoorViewEnabled: true,
                                mapToolbarEnabled: false,
                                onCameraIdle: () {
                                  locationController.updatePosition(
                                    cameraPosition,
                                    true,
                                  );
                                },
                                onCameraMove: ((position) =>
                                    cameraPosition = position),
                                onMapCreated:
                                    (GoogleMapController googleController) {
                                  locationController
                                      .setMapController(googleController);
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ProjectDimensions.heightTwenty,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: ProjectDimensions.heightTen / 2,
                          ),
                          child: SizedBox(
                            height: ProjectDimensions.heightTwenty * 2,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  locationController.addressTypeList.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    locationController.setAddressType(index);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: ProjectDimensions.widthTwenty,
                                      vertical: ProjectDimensions.heightTen,
                                    ),
                                    margin: EdgeInsets.only(
                                      right: ProjectDimensions.widthTwenty,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).cardColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ProjectColors.kGreyColor,
                                          blurRadius: 2.0,
                                          spreadRadius: 0.0,
                                          offset: Offset(0.0,
                                              0.0), // shadow direction: bottom right
                                        )
                                      ],
                                    ),
                                    child: Icon(
                                      index == 0
                                          ? Icons.home
                                          : index == 1
                                              ? Icons.work
                                              : Icons.location_on,
                                      color:
                                          locationController.addressTypeIndex ==
                                                  index
                                              ? ProjectColors.kPrimaryColor
                                              : ProjectColors.kGreyColor,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ProjectDimensions.heightTwenty,
                        ),
                        MediumText(
                          text: "My Physical Address",
                        ),
                        SizedBox(
                          height: ProjectDimensions.heightTen / 2,
                        ),
                        InputField(
                          controller: addressController,
                          hintText: "Your Address",
                          labelText: 'Your Address',
                          icon: Icons.location_on_outlined,
                        ),
                        SizedBox(
                          height: ProjectDimensions.heightTwenty,
                        ),
                        MediumText(
                          text: "Your Full Name",
                        ),
                        SizedBox(
                          height: ProjectDimensions.heightTen / 2,
                        ),
                        InputField(
                          controller: contactPersonNameController,
                          hintText: "Full Name",
                          labelText: 'Full Name',
                          icon: Icons.person_2_outlined,
                        ),
                        SizedBox(
                          height: ProjectDimensions.heightTwenty,
                        ),
                        MediumText(
                          text: "Your Phone Number",
                        ),
                        SizedBox(
                          height: ProjectDimensions.heightTen / 2,
                        ),
                        InputField(
                          controller: contactPersonNumberController,
                          hintText: "Phone Number",
                          labelText: 'Phone Number',
                          icon: Icons.phone_android,
                        ),
                        SizedBox(
                          height: ProjectDimensions.heightTwenty,
                        ),
                        GetBuilder<LocationController>(
                          builder: (locationController) {
                            return SizedBox(
                              width: double.infinity,
                              height: ProjectDimensions.heightFortyFive + 10,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: ProjectColors.kPrimaryColor,
                                  backgroundColor: ProjectColors.kPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                child: Text(
                                  "Save Address",
                                  style: kTabBarItemFontStyle.copyWith(
                                    fontSize: 18.0 * kMultiplier * height,
                                    fontWeight: FontWeight.bold,
                                    color: ProjectColors.kWhiteColor,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
