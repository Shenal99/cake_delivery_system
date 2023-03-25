import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Order');

class OrdersRepository{


  // order add
  static Future<Response> addOrder({
    required String orderId,
    required String name,
    required String address,
    required String mobile,
    required String productName,
    required String qty,
    required String totalPrice,
    required String state,
  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "orderId":orderId,
      "order_name": name,
      "address": address,
      "mobile" : mobile,
      "productName": productName,
      "qty" : qty,
      "totalPrice": totalPrice,
      "state" : state
    };

    var result = await documentReferencer
        .set(data)
        .whenComplete(() {
          response.code = 200;
          response.message = "Sucessfully added to the database";
        })
        .catchError((e) {
            response.code = 500;
            response.message = e;
        });

        return response;
  }

  //order read
    static Stream<QuerySnapshot> readOrder() {
    CollectionReference notesItemCollection =
        _Collection;

    return notesItemCollection.snapshots();
  }

  //update order
  static Future<Response> updateOrder({
    required String Id,//check 
    required String orderId,
    required String name,
    required String address,
    required String mobile,
    required String productName,
    required String qty,
    required String totalPrice,
    required String state,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc(Id);

    Map<String, dynamic> data = <String, dynamic>{
      "orderId": orderId,
      "order_name": name,
      "address": address,
      "mobile" : mobile,
      "productName": productName,
      "qty" : qty,
      "totalPrice": totalPrice,
      "state" : state
    };

    await documentReferencer
        .update(data)
        .whenComplete(() {
           response.code = 200;
          response.message = "Sucessfully updated Order";
        })
        .catchError((e) {
            response.code = 500;
            response.message = e;
        });

        return response;
  }

  //delete order
  static Future<Response> deleteOrder({
    required String Id,
  }) async {
     Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc(Id);

    await documentReferencer
        .delete()
        .whenComplete((){
          response.code = 200;
          response.message = "Sucessfully Deleted Order";
        })
        .catchError((e) {
           response.code = 500;
            response.message = e;
        });

   return response;
  }
}