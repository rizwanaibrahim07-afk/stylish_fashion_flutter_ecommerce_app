

import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/model/subcategorymodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/product_model.dart';

class Productcontroller extends GetxController {

  static Productcontroller get instance => Get.find();


  final supabase=Supabase.instance.client;

  var products=<ProductModel>[].obs;


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



}