
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/model/product_model.dart';
import 'package:stylish_fashion/features/shop/model/subcategorymodel.dart';

import 'package:supabase_flutter/supabase_flutter.dart';


class ProductsbySubCategoryController extends GetxController{

  static ProductsbySubCategoryController get instance => Get.find();

  final supabase=Supabase.instance.client;

  var filteredproducts=<ProductModel>[].obs;
  var subcategories=<SubCategoryModel>[].obs;
  var isLoading=false.obs;
  void onInit(){


    super.onInit();
  }

  Future<void> loadProductswithSubCategory(int subcategory_id)async{
    try{
      isLoading.value=true;
      print("loading products:$subcategory_id");
      final data=await supabase.from('products').
      select().eq('subcategory_id',subcategory_id);

      filteredproducts.value=data.map<ProductModel>((p)=>ProductModel.fromJson(p)).toList();

    }catch (e){
      print('load products by id error:$e');

    }finally{
      isLoading.value=false;
    }
  }
}