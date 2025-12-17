
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/controllers/categoryController.dart';
import 'package:stylish_fashion/features/shop/controllers/productcontroller.dart';

import 'package:stylish_fashion/features/shop/controllers/whishlistcontroller.dart';
import 'package:stylish_fashion/features/shop/screens/widgets/SpromoSlider.dart';
import 'package:stylish_fashion/features/shop/screens/widgets/home_categories.dart';
import 'package:stylish_fashion/features/shop/screens/widgets/vertical_product_card.dart';

import '../../../common/layout/SGridlayout.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/cartcounter/cartcounter.dart';
import '../../../common/widgets/custom_shapes/containers/primaryheadercontainer.dart';

import '../../../common/widgets/ssectionheader.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_string.dart';
import '../../../utils/constants/size.dart';

import '../controllers/cart_controller.dart';
import 'all products/all_product.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key,  });
  final CategoryController categoryController= Get.put(CategoryController());
final Productcontroller productcontroller=Get.put(Productcontroller());
final WishlistController wishlistController=Get.put(WishlistController());

final CartController cartcontroller=Get.find<CartController>();
   @override
  Widget build(BuildContext context) {

    return Scaffold(
     body: SingleChildScrollView(         child: Column(
           children: [
             primaryheadercontainer(child:Column(
               children: [
                 //........appbar......
                 SAppbar(title:Column(crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text('Stylish ',style: Theme.of(context).textTheme.headlineMedium!.apply(color: SColors.white),),
             Text('Fashion',style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.white),),
           ],),
                        actions: [
                          CartCounter(),
                        ],),
                 //....Categories...

                 Padding(padding: EdgeInsets.all(SSizes.spaceBtwItem),
                 child: Column(
                   children: [
                     SSectionHeader(title: 'Popular Categories',actionButton: false,textColor: Colors.white,),
                    //category
                     SizedBox(height:8 ,),
                     SHomeCategories( ),
                   ],
                 ),

                 )

               ]
             )),
           //...body...
           Padding(padding:EdgeInsets.all(SSizes.defaultSpace/8),
             child: Column(
               children: [
                 SpromoSlider( banners:[SImages.banner1,SImages.banner3,SImages.banner4], ),

            SizedBox(height: SSizes.spaceBtwItem,),
                 //heading
                  SSectionHeader(title: 'Popular Products',textColor: SColors.primary,onPressed: ()=>Get.to(()=>AllProduct()),),
                 const SizedBox(height: SSizes.spaceBtwItem,),
                 //popular products
    Obx(
    (){if(productcontroller.isLoading.value){
    return Center(child: CircularProgressIndicator());
    }if(productcontroller.products.isEmpty){
    return Text('No products');
    }

    return  SGridlayout(itemCount: 4,itemBuilder: (_, index){
    final product=productcontroller.products[index];
    return SProductCardVertical(product: product, );} );}),


    ],
    ),
    )


           ]
         ),
       ),
    );
  }
}











