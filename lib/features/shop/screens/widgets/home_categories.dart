import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/controllers/categoryController.dart';
import 'package:stylish_fashion/features/shop/controllers/productcontroller.dart';
import 'package:stylish_fashion/features/shop/controllers/subcategoryController.dart';
import 'package:stylish_fashion/features/shop/model/categoryModel.dart';
import 'package:stylish_fashion/features/shop/model/product_model.dart';
import 'package:stylish_fashion/features/shop/model/subcategorymodel.dart';

import '../../../../common/widgets/SVerticalimage/SVerticalimage.dart';
import '../../../../utils/constants/image_string.dart';
import '../../model/cart_item_model.dart';
import '../sub category/sub_categories.dart';
class SHomeCategories extends StatelessWidget {

  final controller=Get.put(CategoryController());
   SHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

        return Obx((){

            if(controller.isLoading.value){
            return Center(child: CircularProgressIndicator());
          }if(controller.categories.isEmpty){
            return Text('No categories');
          }
           return SizedBox(height: 120,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index){
             final category=controller.categories[index];
                  return SverticalimageText(image:category.imageUrl,textColor: Colors.white,
                    backgroundcolor: Colors.white, title: category.name,
                    onTap: ()=>Get.to(()=>SubCategoriesScreen(category:category,  )),);
                }),
          );

      },
    );
  }
}