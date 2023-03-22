// import 'package:clear_water_and_sanitization/models/SurveyFModel.dart';
// import 'package:clear_water_and_sanitization/models/WaterDonation.dart';
import 'package:cake_delivery_system/models/order.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({Key? key}) : super(key: key);

  @override
  State<AddOrder> createState() => _CrudAppState();
}

class _CrudAppState extends State<AddOrder> {

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final mobileController = TextEditingController();
  final productNameController = TextEditingController();
  final qtyController = TextEditingController();
  final totalPriceController = TextEditingController();
  final stateController = TextEditingController();
  final double textBorder = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Order"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children:  <Widget> [
          const SizedBox(height: 40),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: 'name',
              labelText: 'Enter name',
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(textBorder))),

            ),
          ),
          const SizedBox(height: 40),
          TextField(
            controller: addressController,
            decoration: InputDecoration(
              hintText: 'address',
              labelText: 'Enter address',
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(textBorder))),

            ),
          ),
          const SizedBox(height: 40),
          TextField(
            controller: mobileController,
            decoration: InputDecoration(
              hintText: 'mobile',
              labelText: 'Enter mobile',
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(textBorder))),

            ),
          ),
          const SizedBox(height: 40),
          TextField(
            controller: productNameController,
            decoration: InputDecoration(
              hintText: 'productName',
              labelText: 'Enter productName',
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(textBorder))),

            ),
          ),
          const SizedBox(height: 40),
          TextField(
            controller: qtyController,
            decoration: InputDecoration(
              hintText: 'qty',
              labelText: 'Enter qty',
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(textBorder))),

            ),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: totalPriceController,
            decoration: InputDecoration(
              hintText: 'totalPrice',
              labelText: 'Enter totalPrice',
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(textBorder))),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 24),
          TextField(
            controller: stateController,
            decoration: InputDecoration(
              hintText: 'state',
              labelText: 'Enter  state',
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(textBorder))),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                onPrimary: Colors.white,
                shadowColor: Colors.blueAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                minimumSize: const Size(50, 50),
              ),
              onPressed: () {
                Navigator.pop(context);
                createOrder(
                  name: nameController.text,
                  address: addressController.text,
                  mobile: mobileController.text,
                  productName: productNameController.text,
                  qty: qtyController.text,
                  totalPrice: totalPriceController.text,
                  state: stateController.text,
                );
              },
              child: const Text('Add Donation', style: TextStyle(fontSize: 18)),
          )
        ],
      ),
    );
  }

  Future<dynamic> createOrder({
    required String name,
    required String address,
    required String mobile,
    required String productName,
    required String qty,
    required String totalPrice,
    required String state
  }) async{
    final docOrder = FirebaseFirestore.instance.collection('docOrder').doc();

    final orderFModel = order (
        id: docOrder.id,
        address: address,
        name: name,
        mobile: mobile,
        productName: productName,
        qty: qty,
        totalPrice: totalPrice,
        state: state
    );

    final json = orderFModel.toJson();

    await docOrder.set(json);
  }
  
  order({required String id, required String address, required String name, required String mobile, required String productName, required String qty, required String totalPrice, required String state}) {}
}

