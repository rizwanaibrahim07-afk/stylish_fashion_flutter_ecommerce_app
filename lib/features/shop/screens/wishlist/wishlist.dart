import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/controllers/productcontroller.dart';
import 'package:stylish_fashion/features/shop/model/cart_item_model.dart';
import 'package:stylish_fashion/features/shop/model/product_model.dart';
import 'package:stylish_fashion/utils/helpers/helperfunctions.dart';

import '../../../../common/icons/circular_icon.dart';
import '../../../../common/layout/SGridlayout.dart';
import '../../../../common/styles/shadow_style.dart';
import '../../../../common/widgets/SVerticalimage/Sroundedimage.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../controllers/whishlistcontroller.dart';
import '../homeScreen.dart';
import '../widgets/product/product_detail_screen.dart';
import '../widgets/product/product_title.dart';
import '../widgets/vertical_product_card.dart';
class WishlistScreen extends StatelessWidget {
  final  wishlistController = Get.put(WishlistController());
  final productcontroller=Get.put(Productcontroller());

  WishlistScreen({super.key,  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: SAppbar(title: Text('WishList',style: Theme.of(context).textTheme.headlineMedium),
      actions: [SCircularIcon(icon: Icons.add,
        color: SColors.primary,onPressed: ()=>Get.to(HomeScreen()),),
      ],),
      body:Obx(
          (){
            if(wishlistController.wishlistProducts.isEmpty){
              return Center(child: Text('no items in wishlist'));
            }
            return SingleChildScrollView(
              child:  SGridlayout(
                  itemCount: wishlistController.wishlistProducts.length, itemBuilder:
                  (context, index) {
                final product = wishlistController.wishlistProducts[index];
                return GestureDetector(onTap: () {
                  Get.to(() => ProductDetailScreen(product: product));
                },
                  child: Column(mainAxisSize: MainAxisSize.min,
                    children: [

                      SRoundedContainer(
                        padding: EdgeInsets.all(SSizes.sm),
                        backgroundColor: Colors.transparent,
                        child: Stack(
                          children: [
                            //thumbnail,
                            SizedBox(height: 130, width: 130,
                                child: SRoundedImage(isNetworkImage: true,
                                  imageUrl: product.imageUrl!,
                                  applyImageRadius: true,
                                  height: 90,
                                  fit: BoxFit.cover,)),


                            //fav icon
                            Positioned(top: 0, right: 0,
                                child: Obx(() { // Obx observes the reactive variable
                                  final bool isInWishlist = wishlistController
                                      .isProductInWishlist(product.id);
                                  return SCircularIcon(
                                    icon: isInWishlist ? Icons.favorite : Icons
                                        .favorite_border,
                                    color: isInWishlist ? Colors.red : Colors
                                        .grey, size: 23,
                                    onPressed: () {
                                      wishlistController.toggleWishlist(
                                          product); // Call the toggle logic
                                    },
                                  );
                                })
                            ),
                          ],
                        ),
                      ),

                      Padding(padding: EdgeInsets.only(left: SSizes.sm),
                        child:


                        ProductTitleText(text: product.title),


                      ),
                    ],
                  ),);}),
            );
          },
      ),);





  }}
