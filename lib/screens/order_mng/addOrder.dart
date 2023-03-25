import 'package:cake_delivery_system/screens/order_mng/listOrder.dart';
import 'package:cake_delivery_system/models/order.dart';
import 'package:flutter/material.dart';
import 'package:cake_delivery_system/repositories/order_repository.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AddOrderScreen extends StatefulWidget {

  @override
  _AddOrderScreenState createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _orderIdController = TextEditingController();
  final _orderNameController = TextEditingController();
  final _orderAddressController = TextEditingController();
  final _orderMobileNumberController = TextEditingController();
  final _orderProductName = TextEditingController();
  final _orderQty = TextEditingController();
  final _orderTotalPrice = TextEditingController();
  final _orderState = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final OrderIdField = TextFormField(
        controller: _orderIdController,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.confirmation_number),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Order ID",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final nameField = TextFormField(
        controller: _orderNameController,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Order Person",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final addressField = TextFormField(
        controller: _orderAddressController,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.location_on),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "order Address",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
      final MobileField = TextFormField(
        controller: _orderMobileNumberController,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
          if (int.tryParse(value) == null) {
            return 'Please enter a valid number';
          }
          if (value.length > 10) {
            return 'Maximum length exceeded';
          }
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.phone),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Contact Number",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
      final productNameField = TextFormField(
        controller: _orderProductName,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.abc),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "order Product Name",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

      final qtyField = TextFormField(
        controller: _orderQty,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
           if (int.tryParse(value) == null) {
            return 'Please enter a valid number';
          }
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.numbers),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Order Qty (Kg)",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

      final TotalPriced = TextFormField(
        controller: _orderTotalPrice,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.abc),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "date",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
        final OrderState = TextFormField(
        controller: _orderState,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.abc),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "order status",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final viewListbutton = TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => ListOrderScreen(),
            ),
            (route) => false, //To disable back feature set to false
          );
        },
        child: const Text('View List of orders'));

    final SaveButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: 160.0,
      height: 40.0,
      padding: const EdgeInsets.all(20.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var response = await OrdersRepository.addOrder(
                orderId: _orderIdController.text,
                name: _orderNameController.text,
                address: _orderAddressController.text,
                mobile: _orderMobileNumberController.text,
                productName: _orderProductName.text,
                qty: _orderQty.text,
                totalPrice: _orderTotalPrice.text,
                state: _orderState.text);
            if (response.code != 200) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(response.message.toString()),
                    );
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(response.message.toString()),
                    );
                  });
            }
          }
        },
        child: Text(
          "Save",
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 248, 217),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add order'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OrderIdField,
                    const SizedBox(height: 25.0),
                    nameField,
                    const SizedBox(height: 25.0),
                    addressField,
                    const SizedBox(height: 25.0),
                    MobileField,
                    const SizedBox(height: 35.0),
                    productNameField,
                    const SizedBox(height: 35.0),
                    qtyField,
                    const SizedBox(height: 35.0),
                    TotalPriced,
                    const SizedBox(height: 35.0),
                    OrderState,
                    const SizedBox(height: 35.0),
                    SaveButon,
                    const SizedBox(height: 25.0),
                    viewListbutton,
                    const SizedBox(height: 15.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
