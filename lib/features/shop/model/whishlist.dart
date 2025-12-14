
class WishlistItem {
  final int id;
  final String user_id;
  final int productId;
  final DateTime createdAt;


  WishlistItem({
    required this.id,
    required this.user_id,
    required this.productId,
    required this.createdAt,
  });

  factory WishlistItem.fromJson(Map<String, dynamic> json) {
    return WishlistItem(
      id: json['id'],
      user_id: json['user_id'],
      productId: json['product_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
