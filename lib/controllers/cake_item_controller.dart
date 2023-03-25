import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/cake_item_controller.dart';
import '../../models/cake_item_list_model/cake_item_list_model.dart';
import '../../models/cake_item_model/cake_item_model.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  CakeListController cakeListController = Get.find(tag: 'cakeListController');
  late CakeItemListModel store;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    store = cakeListController.cakeListStore;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(30),
        padding: const EdgeInsets.all(30),
        color: Color.fromARGB(255, 252, 219, 230),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Enter Cake Name"),
            ),
            TextField(
              controller: descriptionController,
              decoration:
                  const InputDecoration(hintText: "Enter Cake Description"),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(hintText: "Enter Cake Price"),
            ),
            ElevatedButton(
              onPressed: () {
                String id = DateTime.now().millisecond.toString();
                store.addCakeItem(CakeItemModel(
                  id: id,
                  name: nameController.text,
                  description: descriptionController.text,
                  price: 'Rs.${priceController.text}',
                ));

                Get.back();
              },
              child: const Text("Add Cake"),
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
