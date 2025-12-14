import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/model/cart_item_model.dart';
import 'package:stylish_fashion/features/shop/model/product_model.dart';

import 'features/personalizations/screens/settings/settings.dart';
import 'features/shop/screens/cart/cart_screen.dart';
import 'features/shop/screens/homeScreen.dart';
import 'features/shop/screens/wishlist/wishlist.dart';
class NavigationMenu extends StatelessWidget {

  const NavigationMenu({super.key,    });

  @override

  Widget build(BuildContext context) {
    final controller=Get.put(NavigationController());
    return Scaffold(bottomNavigationBar: Obx(
        ()=> NavigationBar(
          height: 80,
          elevation: 0,

          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index)=>controller.selectedIndex.value=index,
          destinations:const [ NavigationDestination(icon:Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon:Icon(Icons.person), label: 'Profile'),
        NavigationDestination(icon:Icon(Icons.favorite), label: 'Wishlist'),
        NavigationDestination(icon:Icon(Icons.shopping_bag), label: 'Bag'),

      ]),
    ),
    body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}
class NavigationController extends GetxController{

  final Rx<int> selectedIndex=0.obs;

   final screens=[ HomeScreen(),
     SettingsScreen(),WishlistScreen(),
     CartScreen(
       ),];
}