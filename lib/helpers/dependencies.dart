import 'package:cjays/data/api/api_client.dart';
import 'package:get/get.dart';

import '../data/repository/product_repo.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: 'https://api.example.com'));

  Get.lazyPut(() => ProductRepository(apiClient: Get.find()));
}
