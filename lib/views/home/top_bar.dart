import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../manage_products/manage_products.dart';


class HomeTopBar extends StatelessWidget {
  const HomeTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          //redirect to manage products page where user can add/delete/update products
          onPressed: () => Get.to(const ManageProducts()),
          child: const Text("Manage Cakes"),
        ),
      ],
    );
  }
}
