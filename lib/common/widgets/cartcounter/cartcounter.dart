
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/model/product_model.dart';

import '../../../features/shop/screens/cart/cart_screen.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helperfunctions.dart';
class CartCounter extends StatelessWidget {

  const CartCounter({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark=SHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(onPressed:()=>Get.to(CartScreen()),
         icon: Icon(Icons.shopping_bag,color:dark?Colors.white:Colors.black,)),
        Positioned(right: 0,
          child:Container(
            width:18 ,
            height: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.black,

            ),
            child: Center(child: Text('2',style:TextStyle(color: SColors.white,fontSize:10 ),)),

          ), )

      ],
    );
  }
}





















