import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stylish_fashion/features/shop/controllers/productbysub.dart';
import 'package:stylish_fashion/features/shop/screens/sub%20category/subcategoryproducts.dart';



import '../../../../common/widgets/SVerticalimage/Sroundedimage.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/ssectionheader.dart';

import '../../../../utils/constants/size.dart';
import '../../controllers/subcategoryController.dart';

import '../../model/categoryModel.dart';

class SubCategoriesScreen extends StatelessWidget{
  final CategoryModel category;

  SubCategoriesScreen({super.key,
     required this.category  });

  @override
  Widget build(BuildContext context) {

    final controller=Get.put(SubCategoryController(category.id));

      return Scaffold(

        appBar: SAppbar(title: Text(category.name), showBackArrow: true,),
        body: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(SSizes.defaultSpace),
            child: Column(
              children: [
                SRoundedImage(isNetworkImage:true,imageUrl:category.bannerimageUrl,
                  width: double.infinity,
                  applyImageRadius: true,),
                SizedBox(height: SSizes.spaceBtwSections),
    Obx((){

    if(controller.isLoading.value){
    return Center(child: CircularProgressIndicator());
    }if(controller.subcategories.isEmpty){
    return Text('No categories');
    }

    return
    ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.subcategories.length,
      scrollDirection:Axis.vertical ,
      itemBuilder: (_,index)
    {
      final sub = controller.subcategories[index];

     return  subcategoryproducts(sub: sub);
    }
    );
      },),
              ],
            ),),
        ),
      );
    }
  }

