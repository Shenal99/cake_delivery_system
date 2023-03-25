import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import '../../controllers/cake_item_controller.dart';
import '../../models/cake_item_list_model/cake_item_list_model.dart';

class HomeProductList extends StatefulWidget {
  const HomeProductList({Key? key}) : super(key: key);

  @override
  State<HomeProductList> createState() => _HomeProductListState();
}

class _HomeProductListState extends State<HomeProductList> {
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
                  ElevatedButton(
                    onPressed: () {
                      // order.addOrderItem(store.foodItems[index]);
                    },
                    child: const Text("Add to Cart"),
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
