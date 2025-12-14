
import 'dart:convert';

class ProductModel {
  int id;
  bool? stock;
  double price;
  String title;
  double? salePrice;
  String? brandname;
  String? description;
  int? category_id;
  String? imageUrl;
  int? subcategory_id;
 final List<String>? sizes;



  ProductModel({
    this.sizes,
    required this.id,
    required this.title,
    this.stock,
    required this.price,
    this.subcategory_id, 
    this.brandname,
    this.imageUrl,
    this.salePrice,
    this.category_id,
    this.description,

  });

  factory ProductModel.fromJson(Map<String,dynamic> Json){
    return ProductModel(
      id: Json['id'],
      title:Json ['title'],
      stock: Json['stock'],
      price: Json['price']is int?(Json['price']as int).toDouble():
    double.tryParse(Json['price'].toString())??0.0,
      brandname: Json['brandname'],
      imageUrl: Json['imageUrl'],category_id: Json['category_id'],
      subcategory_id: Json['subcategory_id'],
      salePrice:Json['saleprice']is int?(Json['saleprice']as int).toDouble():double.tryParse(Json['saleprice'].toString())??0.0,description: Json['description']       ,sizes: List<String>.from(Json["sizes"]??[]) ,);
  }

}