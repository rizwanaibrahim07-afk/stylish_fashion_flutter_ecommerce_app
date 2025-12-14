
class Orderitems {
  final String id;
  final int order_id;
  final int product_id;
  final int quantity;

  Orderitems({
    required this.id,
    required this.order_id,
    required this.product_id,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {

    return {
      'order_id': order_id,
      'product_id': product_id,
      'quantity': quantity,
    };
  }

  factory Orderitems.fromJson(Map<String, dynamic> json) {


    return Orderitems(
      id: json['id'] ,
      order_id: json['order_id'] as int,
      product_id: json['product_id'] as int,
      quantity: json['quantity'] as int,
    );
  }
}
