
import 'orderitemmodel.dart';

enum OrderStatus { pending, processing, shipped, delivered, cancelled }

class OrderModel {
  final int id;
  final String user_id;
  final OrderStatus status;
  final double totalamount;
  final DateTime created_at ;
  final String address_id;
  final DateTime delivery_date;
  final List<Orderitems> items;
OrderModel({required this.id,
  required this.user_id,
  required this.status,
  required this.totalamount, required
  this.created_at,
  required this.address_id,
  required this.delivery_date,
  required this.items});


  factory OrderModel.fromJson(Map<String, dynamic> json) {
    print('DEBUG OrderModel JSON: $json');

    var itemsList = json['ordereditems'] as List? ?? [];
    List<Orderitems> items = itemsList.map((i) => Orderitems.fromJson(i)).toList();

    return OrderModel(
      id: json['id'] as int,
      user_id: json['user_id'] ,
      status: OrderStatus.values.firstWhere((e) => e.name == json['status']),
      totalamount: (json['totalamount'] as num).toDouble(),
      created_at: DateTime.parse(json['created_at'] as String),
      address_id: (json['address_id'])as String,
      delivery_date: DateTime.parse(json['delivery_date'] as String),
      items: items,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': user_id,
      'status': status.name,
      'totalamount': totalamount,
      'created_at': created_at.toIso8601String(),
      'address_id': address_id,
      'delivery_date':delivery_date.toIso8601String(),
    };
  }

}
