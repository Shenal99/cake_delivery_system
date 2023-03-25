import 'package:flutter/material.dart';

import 'home_product_list.dart';
import 'top_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            //top buttons for order and manage product
            HomeTopBar(),
            //list of products to add to cart
            HomeProductList(),
          ],
        ),
      ),
    );
  }
}
