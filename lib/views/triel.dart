import 'package:cjays/controllers/product_controller.dart';
import 'package:cjays/routes/routes_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/Product.dart';

class TrialDetails extends StatelessWidget {
  TrialDetails({super.key});

  ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    debugPrint(
        'productController.productList.length: ${productController.productList.length}');

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Trial Details'),
          leading: IconButton(
              onPressed: () {
                Get.toNamed(RouteHelper.home);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            productController.productList.length,
            (index) => Center(
              child: Text(
                productController.productList[index].name!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
