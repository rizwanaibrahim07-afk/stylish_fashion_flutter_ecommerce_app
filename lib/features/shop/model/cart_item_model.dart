class CartItemModel {
 final int id;
 late final int quantity;
  final int productId;
  double salePrice;
  String? imageUrl;
  String? title;
  String? brandname;


  CartItemModel({required this.id,
    required this.quantity,
    required this.productId,
    this.imageUrl,
    required this.salePrice,
    this.title,
    this.brandname,

  });
 factory CartItemModel.fromJson(Map<String,dynamic> Json){
   return CartItemModel(
     id: Json['id'], title:Json ['title']??'',
      brandname: Json['brandname']??'',
     imageUrl: Json['imageUrl']??'',
     salePrice:Json['salePrice']is int?(Json['salePrice']as int).toDouble():double.tryParse(Json['salePrice'].toString())??0.0,
      quantity: Json['quantity']??'1', productId: Json['product_id']);
 }


}