import 'package:cjays/data/api/api_client.dart';
import 'package:cjays/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepository {
  ApiClient apiClient;
  final SharedPreferences preferences;

  LocationRepository({required this.apiClient, required this.preferences});

  Future<Response> getAddressFromGeoCode(LatLng latLng) async {
    return await apiClient.getData('${ProjectConstants.GEOCODE_URI}'
        '?lat=${latLng.latitude}&lng=${latLng.longitude}');
  }

  String getUserAddress() {
    return preferences.getString(ProjectConstants.USER_ADDRESS) ?? '';
  }
}
