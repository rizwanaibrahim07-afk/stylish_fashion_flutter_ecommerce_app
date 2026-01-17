
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
  void sortProducts(String sortOption) {
    switch (sortOption) {
      case 'Name':
        filteredproducts.sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
        break;
      case 'High Price':
        filteredproducts.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Lower Price':
        filteredproducts.sort((a, b) => a.price.compareTo(b.price));
        break;

      case 'Discount':
        filteredproducts.sort((a, b) => (b.salePrice ?? 0).compareTo(a.salePrice ?? 0));
        break;
    }
  }
}