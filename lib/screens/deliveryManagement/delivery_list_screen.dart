import 'package:cake_delivery_system/models/delivery.dart';
import 'package:cake_delivery_system/repositories/delivery_repository.dart';
import 'package:cake_delivery_system/screens/deliveryManagement/add_delivery_screen.dart';
import 'package:cake_delivery_system/screens/deliveryManagement/update_delivery_screnn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListDeliveryScreen extends StatefulWidget {
  const ListDeliveryScreen({Key? key}) : super(key: key);

  @override
  _ListDeliveryScreenState createState() => _ListDeliveryScreenState();
}

class _ListDeliveryScreenState extends State<ListDeliveryScreen> {
  final Stream<QuerySnapshot> collectionReference =
      DeliveryRepository.getDeliveries();
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("List of Deliveries"),
        backgroundColor: Colors.purple[800],
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => AddDeliveryScreen(),
                ),
                (route) =>
                    false, //if you want to disable back feature set to false
              );
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: collectionReference,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            List<QueryDocumentSnapshot> filteredList = snapshot.data!.docs.where((doc) => doc['order_id'].toString().toLowerCase().contains(_searchText.toLowerCase())).toList();
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search by Order Id',
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: filteredList.map((e) {
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("Order Id: " + e["order_id"]),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          Icon(Icons.person_outline,
                                              color: Colors.purple[800], size: 18),
                                          SizedBox(width: 5),
                                          Text(
                                            "Delivery Person: " +
                                                e['delivery_person_name'],
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(Icons.phone_outlined,
                                              color: Colors.purple[800], size: 18),
                                          SizedBox(width: 5),
                                          Text(
                                            "Phone Number: " +
                                                e['delivery_person_phoneNo'],
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton.icon(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.purple[800],
                            size: 18,
                          ),
                          label: Text(
                            'Edit',
                            style: TextStyle(
                              color: Colors.purple[800],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil<dynamic>(
                              context,
                              MaterialPageRoute<dynamic>(
                                builder: (BuildContext context) =>
                                    UpdateDeliveryScreen(
                                  delivery: Delivery(
                                    deliveryId: e.id,
                                    orderId: e["order_id"],
                                    deliveryPersonName:
                                        e["delivery_person_name"],
                                    deliveryPersonPhoneNumber:
                                        e["delivery_person_phoneNo"],
                                    deliveryAddress: e["delivery_address"],
                                    deliveryTime: e["delivery_time"],
                                  ),
                                ),
                              ),
                              (route) =>
                                  false, //if you want to disable back feature set to false
                            );
                          },
                        ),
                        TextButton.icon(
                          icon: Icon(
                            Icons.delete,
                            color: Color.fromARGB(255, 154, 27, 27),
                            size: 18,
                          ),
                          label: Text(
                            'Delete',
                            style: TextStyle(
                              color: Color.fromARGB(255, 154, 27, 27),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      onPressed: () async {
                        var response =
                            await DeliveryRepository.deleteDelivery(
                                docId: e.id);
                        if (response.code != 200) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content:
                                      Text(response.message.toString()),
                                );
                              });
                        }
                      },
                    ),
                  ],
                ),
              ]));
            }).toList(),
          ),
              )]);
      }

      return Center(
        child: CircularProgressIndicator(),
      );
    },
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () {
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => AddDeliveryScreen(),
                ),
                (route) =>
                    false, //if you want to disable back feature set to false
              );
            },
    child: Icon(Icons.add),
    backgroundColor: Theme.of(context).primaryColor,
  ),
);
  }
}
