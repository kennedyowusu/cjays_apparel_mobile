import 'package:cjays/data/api/api_client.dart';
import 'package:cjays/utils/app_constants.dart';
import 'package:get/get.dart';

class CategoryRepository {
  final ApiClient apiClient;

  CategoryRepository({required this.apiClient});

  Future<Response> getCategoryList() async {
    return await apiClient.getData(ProjectConstants.CATEGORY_URI);
    // return await apiClient
    //     .getData(ProjectConstants.PRODUCTS_IN_EACH_CATEGORY_URI);
  }
}
