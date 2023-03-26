import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('deliveries');

class DeliveryRepository {

  static Future<Response> addDelivery({
    required String orderId,
    required String deliveryPersonName,
    required String deliveryPersonPhoneNumber,
    required String deliveryAddress,
    required String deliveryTime,
  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "order_id": orderId,
      "delivery_person_name": deliveryPersonName,
      "delivery_person_phoneNo" : deliveryPersonPhoneNumber,
      "delivery_address": deliveryAddress,
      "delivery_time": deliveryTime,
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


  static Stream<QuerySnapshot> getDeliveries() {
    CollectionReference notesItemCollection =
        _Collection;

    return notesItemCollection.snapshots();
  }



  static Future<Response> updateEmployee({
    required String orderId,
    required String deliveryPersonName,
    required String deliveryPersonPhoneNumber,
    required String deliveryAddress,
    required String deliveryTime,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "order_id": orderId,
      "delivery_person_name": deliveryPersonName,
      "delivery_person_phoneNo" : deliveryPersonPhoneNumber,
      "delivery_address": deliveryAddress,
      "delivery_time": deliveryTime,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() {
           response.code = 200;
          response.message = "Sucessfully updated Delivery";
        })
        .catchError((e) {
            response.code = 500;
            response.message = e;
        });

        return response;
  }

  static Future<Response> deleteDelivery({
    required String docId,
  }) async {
     Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc(docId);

    await documentReferencer
        .delete()
        .whenComplete((){
          response.code = 200;
          response.message = "Sucessfully Deleted Delivery";
        })
        .catchError((e) {
           response.code = 500;
            response.message = e;
        });

   return response;
  }
}
