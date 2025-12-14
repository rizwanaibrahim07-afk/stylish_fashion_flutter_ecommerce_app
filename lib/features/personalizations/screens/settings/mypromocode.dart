import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/controllers/couponcntroller.dart';

import '../../../../utils/constants/colors.dart';

class MyPromoCode extends StatelessWidget {
 final controller=Get.put(PromoController());
  MyPromoCode({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(title: Center(child: Text('Promo Coupons')),backgroundColor: SColors.primary,),
       body: Obx(
           (){
             if(controller.promos.isEmpty){
               return Center(child: Text('No promo code',style: TextStyle(color: Colors.white),));
             }
             return ListView.builder(padding:EdgeInsets.all(16),
             itemCount:controller.promos.length,itemBuilder: (context,index){
           final promo=controller.promos[index];
           return Card(color:SColors.lightGrey,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
           margin:EdgeInsets.only(bottom: 20),child: Padding(padding: EdgeInsets.all(16),
               child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text(promo.code,style: TextStyle(fontWeight: FontWeight.w600,fontSize:20 ),),
         Text('${promo.discount_percentage}%Off',style: TextStyle(fontWeight: FontWeight.w600,fontSize:20 ),)
         ],
                 ),
         Text("Is_active:${promo.is_active}")
               ],) ,),);

         });}
       ),);
  }
}
