import 'package:flutter/material.dart';
import 'product_list.dart';
import 'package:get/route_manager.dart';
import '../add_produucts/add_products.dart';

class ManageProducts extends StatelessWidget {
  const ManageProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Get.to(const AddProductPage());
          },
          child: const Text('Add Cake'),
        ),
        const ProductList(),
      ],
    )));
  }
}
