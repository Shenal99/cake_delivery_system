import 'package:cake_delivery_system/models/delivery.dart';
import 'package:cake_delivery_system/repositories/delivery_repository.dart';
import 'package:cake_delivery_system/screens/deliveryManagement/delivery_list_screen.dart';
import 'package:flutter/material.dart';

class UpdateDeliveryScreen extends StatefulWidget {
  final Delivery? delivery;

  UpdateDeliveryScreen({this.delivery});

  @override
  _UpdateDeliveryScreenState createState() => _UpdateDeliveryScreenState();
}

class _UpdateDeliveryScreenState extends State<UpdateDeliveryScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _orderIdController = TextEditingController();
  final _deliveryPersonNameController = TextEditingController();
  final _deliveryPersonPhoneNumberController = TextEditingController();
  final _deliveryAddressController = TextEditingController();
  final _deliveryTimeController = TextEditingController();
  final _docid = TextEditingController();

  @override
  void initState() {
    super.initState();
    _docid.value =
        TextEditingValue(text: widget.delivery!.deliveryId.toString());
    _orderIdController.value =
        TextEditingValue(text: widget.delivery!.orderId.toString());
    _deliveryPersonNameController.value =
        TextEditingValue(text: widget.delivery!.deliveryPersonName.toString());
    _deliveryPersonPhoneNumberController.value = TextEditingValue(
        text: widget.delivery!.deliveryPersonPhoneNumber.toString());
    _deliveryAddressController.value =
        TextEditingValue(text: widget.delivery!.deliveryAddress.toString());
    _deliveryTimeController.value =
        TextEditingValue(text: widget.delivery!.deliveryTime.toString());
  }

  @override
  Widget build(BuildContext context) {
    final DocIDField = TextField(
        controller: _docid,
        readOnly: true,
        autofocus: false,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.note),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "id",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

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
        controller: _deliveryPersonNameController,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Delivery Person",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final phoneNoField = TextFormField(
        controller: _deliveryPersonPhoneNumberController,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
          if(int.tryParse(value)==null){
            return 'Please enter a valid number';
          }
          if(value.length!=10){
            return "Invalid Phone No";
          }
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.phone),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Contact Number",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final AddressField = TextFormField(
        controller: _deliveryAddressController,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.location_on),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Delivery Address",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final TimeField = TextFormField(
        controller: _deliveryTimeController,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.date_range),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Date & Time",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final viewListbutton = TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => ListDeliveryScreen(),
            ),
            (route) => false, //if you want to disable back feature set to false
          );
        },
        child: const Text('View List of Employee'));

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
            var response = await DeliveryRepository.updateEmployee(
                orderId: _orderIdController.text,
                deliveryPersonName: _deliveryPersonNameController.text,
                deliveryPersonPhoneNumber:
                    _deliveryPersonPhoneNumberController.text,
                deliveryAddress: _deliveryAddressController.text,
                deliveryTime: _deliveryTimeController.text,
                docId: _docid.text);
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
                  }).then((value) {
                Navigator.pushAndRemoveUntil<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => ListDeliveryScreen(),
                  ),
                  (route) => false, //To disable back feature set to false
                );
              });
            }
          }
        },
        child: Text(
          "Update",
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 219, 230),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Update Delivery'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
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
                  DocIDField,
                  const SizedBox(height: 25.0),
                  OrderIdField,
                  const SizedBox(height: 25.0),
                  nameField,
                  const SizedBox(height: 25.0),
                  phoneNoField,
                  const SizedBox(height: 25.0),
                  AddressField,
                  const SizedBox(height: 35.0),
                  TimeField,
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
    );
  }
}
