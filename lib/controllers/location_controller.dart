import 'package:cjays/data/repository/location_repo.dart';
import 'package:cjays/models/address_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

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
}
