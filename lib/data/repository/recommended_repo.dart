import 'package:cjays/data/api/api_client.dart';
import 'package:cjays/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedRepository extends GetxService {
  final ApiClient apiClient;

  RecommendedRepository({required this.apiClient});

  Future<Response> getRecommendedList() async {
    return await apiClient.getData(ProjectConstants.RECOMMENDED_PRODUCT_URI);
  }
}
