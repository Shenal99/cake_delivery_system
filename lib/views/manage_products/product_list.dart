import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fooddelivery/views/update_product/update_product.dart';
import 'package:get/get.dart';

import '../../controllers/cake_item_controller.dart';
import '../../models/cake_item_list_model/cake_item_list_model.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  CakeListController cakeListController = Get.find(tag: 'cakeListController');
  late CakeItemListModel store;
  @override
  void initState() {
    super.initState();
    store = cakeListController.cakeListStore;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: ListView.builder(
          itemCount: store.cakeItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 252, 219,230),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(store.cakeItems[index].name),
                    subtitle: Text(store.cakeItems[index].description),
                    trailing: Text(store.cakeItems[index].price),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            store.removeCakeItem(store.cakeItems[index]);
                          },
                          child: const Text("Remove")),
                      ElevatedButton(
                          onPressed: () =>
                              Get.to(UpdateProductPage(store.cakeItems[index])),
                          child: const Text("Update")),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
