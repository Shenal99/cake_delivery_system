import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/cake_item_model/cake_item_model.dart';

class DatabaseService {
  final firestoreInstance = FirebaseFirestore.instance;

  Future<List<CakeItemModel>> getAllProducts() async {
    List<CakeItemModel> cakeItemList = <CakeItemModel>[];
    CakeItemModel cakeItem;
    await firestoreInstance
        .collection('products')
        .get()
        .then((value) => value.docs.forEach((element) {
              //get a list of all docs then loop through each doc and add to list
              //if any change in model of products change here manually in pair value
              cakeItem = CakeItemModel(
                  name: element.data()['name'],
                  price: element.data()['price'],
                  description: element.data()['description'],
                  id: element.data()['id']);
              cakeItemList.add(cakeItem);
            }));
    return cakeItemList;
  }

  void addProduct(CakeItemModel cakeItemModel) {
    int id = DateTime.now().microsecondsSinceEpoch;
    cakeItemModel.id = "$id";
    firestoreInstance
        .collection('products')
        .doc('$id')
        .set(
          cakeItemModel.toJson(),
        )
        .then((value) {})
        .catchError((error) {
      print(error);
    });
  }

  void updateProduct(CakeItemModel cakeItemModel) {
    firestoreInstance
        .collection('products')
        .doc('${cakeItemModel.id}')
        .update(
          cakeItemModel.toJson(),
        )
        .then((value) {})
        .catchError((error) {
      print(error);
    });
  }

  void deleteProduct(CakeItemModel cakeItemModel) {
    firestoreInstance
        .collection("products")
        .doc('${cakeItemModel.id}')
        .delete()
        .then((value) {})
        .catchError((error) {
      print(error);
    });
  }

//   //order section begin here
//   Future<List<CakeItemModel>> getAllOrders() async {
//     List<CakeItemModel> orderItemList = <CakeItemModel>[];
//     CakeItemModel orderItem;
//     await firestoreInstance
//         .collection('products')
//         .get()
//         .then((value) => value.docs.forEach((element) {
//               // foodItemModel.add(FoodItemModel.fromJson(element.data()));
//               //data isn't in form of proper json so have to manually assign it here
//               orderItem = FoodItemModel(
//                   name: element.data()['name'],
//                   price: element.data()['price'],
//                   description: element.data()['description'],
//                   id: element.data()['id']);
//               orderItemList.add(orderItem);
//             }));
//     return orderItemList;
//   }
//
//   void addOrder(FoodItemModel foodItemModel) {
//     //timestamp is to make id different for each order
//     int id = DateTime.now().microsecondsSinceEpoch;
//
//     firestoreInstance
//         .collection('orders')
//         .doc('$id')
//         .set(
//           foodItemModel.toJson(),
//         )
//         .then((value) {})
//         .catchError((error) {
//       print(error);
//     });
//   }
//
//   void deleteOrder(FoodItemModel foodItemModel) {
//     firestoreInstance
//         .collection("orders")
//         .doc('${foodItemModel.id}')
//         .delete()
//         .then((value) {})
//         .catchError((error) {
//       print(error);
//     });
//   }
}
