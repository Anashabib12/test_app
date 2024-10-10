import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/components/product_card.dart';
import 'package:test_app/view/home/product_view_model.dart';

class HomeView extends StatelessWidget {
  final ProductViewModel _productViewModel = Get.put(ProductViewModel());
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grid View Example')),
      body: Column(
        children: [
          Expanded(
              child: Obx(
            () => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two containers per row
                crossAxisSpacing: 10, // Space between columns
                mainAxisSpacing: 10, // Space between rows
                childAspectRatio: 0.4, // Aspect ratio for containers
              ),
              itemCount:
                  _productViewModel.productList.length, // Number of containers
              itemBuilder: (context, index) {
                return ProductCard(
                  product: _productViewModel.productList[index],
                );
              },
              padding: const EdgeInsets.all(10),
            ),
          )),
        ],
      ),
    );
  }
}
