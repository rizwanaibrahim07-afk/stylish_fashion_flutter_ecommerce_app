import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stylish_fashion/features/shop/model/categoryModel.dart';

import 'package:supabase_flutter/supabase_flutter.dart';



class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();
  final supabase=Supabase.instance.client;

  var categories=<CategoryModel>[].obs;
  var isLoading=false.obs;
  void onInit(){
    loadCategory();

    super.onInit();
  }


Future<void> loadCategory()async{
  try{
    isLoading.value=true;
    final data=await supabase.from('categories').
    select();
categories.value=data.map((item)=>CategoryModel.fromJson(item)).toList();
  }catch (e){
    print('load categories error:$e');

  }finally{
    isLoading.value=false;
  }
}
}
