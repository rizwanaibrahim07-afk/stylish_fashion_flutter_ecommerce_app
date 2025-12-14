import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/screens/order/widgets/order_list_items.dart';



import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/size.dart';
import '../../controllers/ordercontoller.dart';
class OrderScreen extends StatelessWidget {

   OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:
    SAppbar(title: Text('My Orders',style:Theme.of(context).textTheme.headlineMedium ,),showBackArrow: true,),
      body:Padding(padding: const EdgeInsets.all(SSizes.defaultSpace),
 child: OrderListItems(),
      ),);
  }
}
