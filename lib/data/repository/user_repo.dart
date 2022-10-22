import 'package:cjays/data/api/api_client.dart';
import 'package:cjays/utils/app_constants.dart';
import 'package:get/get.dart';

class UserRepository {
  final ApiClient apiClient;

  UserRepository({required this.apiClient});

  Future<Response> getUserData() async {
    return await apiClient.getData(
      ProjectConstants.USER_DATA,
    );
  }
}
