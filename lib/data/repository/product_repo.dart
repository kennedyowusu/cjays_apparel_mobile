import 'package:cjays/data/api/api_client.dart';
import 'package:cjays/utils/app_constants.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxService {
  final ApiClient apiClient;

  ProductRepository({required this.apiClient});

  Future<Response> getProductList() async {
    return await apiClient.getData(ProjectConstants.PRODUCT_URI);
  }
}
