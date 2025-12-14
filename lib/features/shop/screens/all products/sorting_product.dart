import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/controllers/productcontroller.dart';

import '../../../../common/layout/SGridlayout.dart';
import '../../../../utils/constants/size.dart';
import '../../model/cart_item_model.dart';
import '../widgets/vertical_product_card.dart';
class SortingProduct extends StatelessWidget {

   SortingProduct({
    super.key,
  });
   final Productcontroller controller=Get.put(Productcontroller());
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          //dropdown
          DropdownButtonFormField(
              decoration: const InputDecoration(prefixIcon: Icon(Icons.sort)),

              items: ['Name','High Price','Lower Price','Sale','Newest'].
              map((option)=>DropdownMenuItem(value:option,child: Text(option))).toList(),
              onChanged:(value){}),
          SizedBox(height: SSizes.spaceBtwItem,),
    Obx(
    (){if(controller.isLoading.value){
    return Center(child: CircularProgressIndicator());
    }if(controller.products.isEmpty){
    return Text('No products');
    }

    return
    SGridlayout(itemCount: controller.products.length, itemBuilder: (_,index){
            final product = controller.products[index];
            return SProductCardVertical(product:product, );});})
        ] );
  }
}

