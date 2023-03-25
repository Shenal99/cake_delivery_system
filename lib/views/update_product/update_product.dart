import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/cake_item_controller.dart';
import '../../models/cake_item_list_model/cake_item_list_model.dart';
import '../../models/cake_item_model/cake_item_model.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage(this.cakeItemModel, {Key? key}) : super(key: key);
  final CakeItemModel cakeItemModel;
  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  CakeListController cakeListController = Get.find(tag: 'cakeListController');
  late CakeItemListModel store;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    store = cakeListController.cakeListStore;
    //assigining peviously saved values to the text fields in order to edit those values
    nameController.text = widget.cakeItemModel.name;
    descriptionController.text = widget.cakeItemModel.description;
    priceController.text = widget.cakeItemModel.price;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: "Name"),
          ),
          TextField(
            controller: descriptionController,
            style: const TextStyle(color: Colors.black, fontSize: 12),
            decoration: const InputDecoration(hintText: "Description"),
          ),
          TextField(
            controller: priceController,
            decoration: const InputDecoration(hintText: "Price"),
          ),
          ElevatedButton(
              onPressed: () {
                store.updateCakeItem(CakeItemModel(
                  id: widget.cakeItemModel.id,
                  name: nameController.text,
                  description: descriptionController.text,
                  price: '${priceController.text}',
                ));
                Get.back();
              },
              child: const Text("Update Cake"))
        ],
      ),
    );
  }
}
