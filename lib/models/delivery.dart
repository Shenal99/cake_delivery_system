class Delivery{
  String? deliveryId;
  String? orderId;
  String? deliveryPersonName;
  String? deliveryPersonPhoneNumber;
  String? deliveryAddress;
  String? deliveryTime;

  Delivery({this.deliveryId,this.orderId,this.deliveryPersonName,this.deliveryPersonPhoneNumber,this.deliveryAddress,this.deliveryTime});
}

// class Delivery {
//   String id;
//   String orderId;
//   String deliveryPersonName;
//   String deliveryPersonPhoneNumber;
//   String deliveryAddress;
//   String deliveryTime;

//   Delivery({
//     required this.id,
//     required this.orderId,
//     required this.deliveryPersonName,
//     required this.deliveryPersonPhoneNumber,
//     required this.deliveryAddress,
//     required this.deliveryTime,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'orderId': orderId,
//       'deliveryPersonName': deliveryPersonName,
//       'deliveryPersonPhoneNumber': deliveryPersonPhoneNumber,
//       'deliveryAddress': deliveryAddress,
//       'deliveryTime': deliveryTime,
//     };
//   }

//   factory Delivery.fromMap(Map<String, dynamic> map) {
//     return Delivery(
//       id: map['id'],
//       orderId: map['orderId'],
//       deliveryPersonName: map['deliveryPersonName'],
//       deliveryPersonPhoneNumber: map['deliveryPersonPhoneNumber'],
//       deliveryAddress: map['deliveryAddress'],
//       deliveryTime: map['deliveryTime'],
//     );
//   }
// }
