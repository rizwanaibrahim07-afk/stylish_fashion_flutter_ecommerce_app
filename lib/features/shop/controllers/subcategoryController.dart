import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/subcategorymodel.dart';

class SubCategoryController extends GetxController{

  static SubCategoryController get instance => Get.find();
  final int category_id;
  SubCategoryController(this.category_id);
  final supabase=Supabase.instance.client;

  var subcategories=<SubCategoryModel>[].obs;
  var isLoading=false.obs;
  void onInit(){
    loadSubCategory(category_id);

    super.onInit();
  }


  Future<void> loadSubCategory(int category_id)async{
    try{
      isLoading.value=true;
      final data=await supabase.from('subcategories').
      select().eq('category_id',category_id);
      subcategories.value=data.map((item)=>SubCategoryModel.fromJson(item)).toList();
    }catch (e){
      print('load subcategories error:$e');

    }finally{
      isLoading.value=false;
    }
  }
}
