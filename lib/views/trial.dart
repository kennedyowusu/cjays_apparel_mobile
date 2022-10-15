import 'package:cjays/controllers/product_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrialScreen extends StatelessWidget {
  const TrialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductCategoryController>(
        builder: (productCategoryController) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Trial Screen'),
              Text(
                'Product Category List: ${productCategoryController.productCategoryList.length}',
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  productCategoryController.productCategoryList.length,
                  (index) => Text(
                    productCategoryController
                            .productCategoryList[index].categoryId!
                            .toString() +
                        productCategoryController
                            .productCategoryList[index].name!,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // productCategoryController.getProductCategoryList();
                },
                child: Text('Get Product Category List'),
              ),

              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: List.generate(
              //     productCategoryController.productCategoryList.length,
              //     (index) => Column(
              //       children: List.generate(
              //         productCategoryController
              //             .productCategoryList[index].products!.length,
              //         (index2) => Text(
              //           productCategoryController
              //               .productCategoryList[index].products![index2].name!,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}
