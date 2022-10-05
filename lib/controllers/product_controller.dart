import 'package:cjays/data/repository/product_repo.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductRepository productRepository;

  ProductController({required this.productRepository});

  List<dynamic> _productList = [];

  List<dynamic> get productList => _productList;

  Future<void> getProductList() async {
    Response response = await productRepository.getProductList();

    if (response.statusCode == 200) {
      _productList = [];

      // _productList.addAll();

      update();
    } else {
      Get.snackbar('Error Occurred', response.statusText.toString());
    }
  }
}
