

import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/model/subcategorymodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/product_model.dart';

class Productcontroller extends GetxController {

  static Productcontroller get instance => Get.find();


  final supabase=Supabase.instance.client;

  var products=<ProductModel>[].obs;

  var allProducts = <ProductModel>[].obs;
  var isLoading=false.obs;
  var selectedsize=''.obs;

  void onInit(){
    loadProducts();

    super.onInit();
  }
  Future<void> loadProducts()async{
    try{
      isLoading.value=true;
      final data=await supabase.from('products').
      select();
      products.value=data.map((item)=>ProductModel.fromJson(item)).toList();
      allProducts.value=data.map((item)=>ProductModel.fromJson(item)).toList();
    }catch (e){
      print('load products error:$e');

    }finally{
      isLoading.value=false;
    }
  }


  void selectedSize(String size){
    selectedsize.value=size;
  }
  double getDiscountPercent(double price,double saleprice){
    if(price==0)return 0;
    return ((price-saleprice)/price)*100;
  }
  void search(String query) {
    if (query.isEmpty) {
      products.assignAll(allProducts);
    } else {
      products.assignAll(
          allProducts.where((p) => p.title.toLowerCase().contains(query.toLowerCase())).toList()
      );
    }
  }

  void sortProducts(String sortOption) {
  switch (sortOption) {
  case 'Name':
  products.sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
  break;
  case 'High Price':
  products.sort((a, b) => b.price.compareTo(a.price));
  break;
  case 'Lower Price':
  products.sort((a, b) => a.price.compareTo(b.price));
  break;

  case 'Discount':
  products.sort((a, b) => (b.salePrice ?? 0).compareTo(a.salePrice ?? 0));
  break;
  }
  }



}