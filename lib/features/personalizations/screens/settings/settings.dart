import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/personalizations/controllers/profile_controller.dart';
import 'package:stylish_fashion/features/personalizations/screens/settings/mypromocode.dart';

import '../../../../common/list/settingsmenu_tile.dart';
import '../../../../common/list/user_profile_tile.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primaryheadercontainer.dart';
import '../../../../common/widgets/ssectionheader.dart';
import '../../../../utils/constants/size.dart';
import '../../../authentication/controllers/logincontroller.dart';
import '../../../shop/model/cart_item_model.dart';
import '../../../shop/screens/cart/cart_screen.dart';
import '../../../shop/screens/order/orders.dart';
import '../address/address.dart';
import '../profile/profile_screen.dart';
class SettingsScreen extends StatelessWidget {

  SettingsScreen({super.key,  });
 final ProfileController profileController= Get.put(ProfileController());
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      body: SingleChildScrollView(child: Column(
        children: [
          primaryheadercontainer(
              child: Column(children: [
                SAppbar(title:Text( 'Settings',style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),),),
                SUserProfiletile(onPressed: () {
                  Get.to(()=>ProfileScreen()); },),
                const SizedBox(height: 8,)
              ],

          )),
          //body
          Padding(padding:const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              const SSectionHeader(title: 'Account Settings',actionButton: false,),
              const SizedBox(height: SSizes.spaceBtwItem,),
              SettingsMenuTile(icon: Icons.home, title: 'My Address', subTitle: 'Set shopping delivery address',
                ontap:()=> Get.to(()=>UserAddressScreen()),),
              SettingsMenuTile(icon: Icons.shopping_basket, title: 'My Cart', subTitle: 'Add remove product and move to checkout',
                  ontap:(){Get.to(()=>CartScreen());} ),
              SettingsMenuTile(icon: Icons.account_balance, title: 'My Bank Account', subTitle: 'Withdraw balance to registered bank account'),
              SettingsMenuTile(icon: Icons.discount_outlined, title: 'My Coupons', subTitle: 'List of all the discounted coupons',
              ontap:(){ Get.to(()=>MyPromoCode());} ),
              SettingsMenuTile(icon: Icons.shopping_bag_outlined, title: 'My Orders ', subTitle: 'In_progress and completed orders',
                ontap:()=> Get.to(()=>OrderScreen()),),
              SettingsMenuTile(icon: Icons.notifications, title: 'Notifications', subTitle: 'Set any kind of notification message'),
              SettingsMenuTile(icon: Icons.security, title: 'Account Privacy', subTitle: 'Manage data usage and connect'),


              SizedBox(height: SSizes.spaceBtwItem),
              SizedBox(width: double.infinity,child: OutlinedButton(onPressed: (){LoginController.instance.signOut();}, child: Text('LogOut')),),
              SizedBox(height: SSizes.spaceBtwSections),
            ],
          ),)
        ],
      ),),
    );
  }
}


