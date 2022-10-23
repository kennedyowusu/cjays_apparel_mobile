import 'package:cjays/data/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepository {
  ApiClient apiClient;
  final SharedPreferences preferences;

  LocationRepository({required this.apiClient, required this.preferences});
}
