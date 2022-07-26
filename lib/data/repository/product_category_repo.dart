import 'package:cjays/data/api/api_client.dart';
import 'package:cjays/utils/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class ProductCategoryRepository {
  ApiClient apiClient;

  ProductCategoryRepository({required this.apiClient});

  Future<Response> getProductCategoryList(id) async {
    return await apiClient
        .getData("${ProjectConstants.CATEGORY_URI}/$id/products");
  }
}
