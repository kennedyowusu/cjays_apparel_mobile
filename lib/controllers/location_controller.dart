import 'dart:convert';

import 'package:cjays/data/repository/location_repo.dart';
import 'package:cjays/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController implements GetxService {
  LocationRepository locationRepository;

  LocationController({required this.locationRepository});

  bool isLoading = false;
  late Position position;
  late Position pickPosition;
  Placemark placeMark = Placemark();
  Placemark pickPlaceMark = Placemark();
  List<AddressModel> addressList = [];
  late List<AddressModel> allAddressList = [];
  List<String> addressTypeList = [
    'Home',
    'Office',
    'Other',
  ];
  int addressTypeIndex = 0;
  late Map<String, dynamic> getAddress;

  late GoogleMapController mapController;
  bool updateAddressData = true;
  bool changeAddress = true;

  void setMapController(GoogleMapController googleMapController) {
    mapController = googleMapController;
  }

  void updatePosition(
      CameraPosition cameraPosition, bool fromAddressScreen) async {
    if (updateAddressData) {
      isLoading = true;
      update();
      try {
        if (fromAddressScreen) {
          position = Position(
            latitude: cameraPosition.target.latitude,
            longitude: cameraPosition.target.longitude,
            timestamp: DateTime.now(),
            heading: 1,
            accuracy: 1,
            altitude: 1,
            speedAccuracy: 1,
            speed: 1,
          );
        } else {
          pickPosition = Position(
            latitude: cameraPosition.target.latitude,
            longitude: cameraPosition.target.longitude,
            timestamp: DateTime.now(),
            heading: 1,
            accuracy: 1,
            altitude: 1,
            speedAccuracy: 1,
            speed: 1,
          );
        }

        if (changeAddress) {
          String address = await getAddressFromGeoCode(
            LatLng(
              cameraPosition.target.latitude,
              cameraPosition.target.longitude,
            ),
          );
          fromAddressScreen
              ? placeMark = Placemark(name: address)
              : pickPlaceMark = Placemark(name: address);
          debugPrint(placeMark.country);
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  Future<String> getAddressFromGeoCode(LatLng latLng) async {
    String address = 'Unknown Address Location';
    Response response = await locationRepository.getAddressFromGeoCode(latLng);
    if (response.body['status'] == 'OK') {
      address = response.body['results'][0]['formatted_address'].toString();
    }
    return address;
  }

  AddressModel getUserAddress() {
    late AddressModel addressModel;
    getAddress = jsonDecode(locationRepository.getUserAddress());

    try {
      addressModel = AddressModel.fromJson(getAddress);
    } catch (e) {
      debugPrint(e.toString());
    }
    return addressModel;
  }

  setAddressType(int index) {
    addressTypeIndex = index;
    update();
  }
}
