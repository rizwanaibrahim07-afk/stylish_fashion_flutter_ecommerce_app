


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/controllers/ordercontoller.dart';
import 'package:stylish_fashion/features/shop/screens/checkout/widget/billingsection/defaultaddressscreen.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helpers/helperfunctions.dart';
import '../../../model/order model.dart';
import '../../../model/product_model.dart';

class Orderdetailscreen extends StatelessWidget {
  final controller=Get.find<OrderController>();
   Orderdetailscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderModel order = Get.arguments as OrderModel;
    final dark = SHelperFunctions.isDarkMode(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final List<int> productIds = order.items.map((e) => e.product_id).toList();
      controller.fetchProducts(productIds);
    });
    controller.getAddressbyId(order.address_id);
    return Scaffold(appBar: AppBar(title: Text('Order Details',style: TextStyle(color:dark? Colors.white:Colors.black),),
      backgroundColor: SColors.primary,
    ),
    body: SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
              if (controller.isDetailLoading.value) {
              return Center(child: CircularProgressIndicator());
              }
              if (controller.product.isEmpty && !controller.isDetailLoading.value) {
          return Center(child: Text("No product details found."));
              }
          return ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: order.items.length,
              separatorBuilder: (_, __) => SizedBox(height: SSizes.spaceBtwItem),
              scrollDirection:Axis.vertical ,
              itemBuilder: (_,index)
              {
                final orderItem = order.items[index];
              final ProductModel? productDetails = controller.product.firstWhereOrNull(
              (p) => p.id == orderItem.product_id
              );
              if (productDetails == null) {
              return ListTile(title: Text("Product details missing for ID: ${orderItem.product_id}"));
              }
                return SRoundedContainer(
                  showborder: true,
                  padding: EdgeInsets.all(SSizes.md),
                  backgroundColor: dark ? SColors.dark : SColors.light,
                  child: Row(
                    children: [

                      SRoundedContainer(
                        height: 60,
                        width: 60,
                        padding: EdgeInsets.all(SSizes.sm),
                        backgroundColor: dark ? SColors.darkerGrey : SColors.light,
                        child: Center(child: Image(image:NetworkImage(productDetails.imageUrl!))),
                      ),
                      SizedBox(width: SSizes.spaceBtwItem),

                      // --- Details Column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(productDetails.title, style: Theme.of(context).textTheme.titleSmall),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Price: \$${productDetails.salePrice}',
                                    style: Theme.of(context).textTheme.bodyMedium!.apply(fontWeightDelta: 1)
                                ),
                                Text(
                                    'Qty: ${orderItem.quantity}',
                                    style: Theme.of(context).textTheme.bodyMedium!.apply(fontWeightDelta: 1, color: SColors.primary)
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
          );
          }),
          SizedBox(height: SSizes.spaceBtwSections,),
          Divider(),
          SizedBox(height: SSizes.spaceBtwSections,),
          Text('Delivery to:',style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: SSizes.spaceBtwItem,),
          Obx((){
            if(controller.address.value==null){
              return Text('loading...');
            }
            final add=controller.address.value!;
            return SRoundedContainer(child: defaultaddress(address: add),
              showborder:true,borderColor: SColors.primary,);
          }),
          SizedBox(height: SSizes.spaceBtwSections,),
          Text('Total Amount Payable:${order.totalamount},',style:Theme.of(context).textTheme.bodyMedium!.apply(fontWeightDelta: 1) ,)
        ],
      ),

    ),
    );
  }
}




