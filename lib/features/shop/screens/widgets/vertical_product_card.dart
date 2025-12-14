import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/model/cart_item_model.dart';
import 'package:stylish_fashion/features/shop/screens/widgets/product/product_detail_screen.dart';
import 'package:stylish_fashion/features/shop/screens/widgets/product/product_title.dart';


import '../../../../common/icons/circular_icon.dart';
import '../../../../common/styles/shadow_style.dart';
import '../../../../common/widgets/SVerticalimage/Sroundedimage.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helpers/helperfunctions.dart';
import '../../controllers/whishlistcontroller.dart';
import '../../model/product_model.dart';
class SProductCardVertical extends StatelessWidget {
  final ProductModel product;
   SProductCardVertical({super.key, required this.product });
  final WishlistController wishlistController = Get.find<WishlistController>();
  @override
  Widget build(BuildContext context) {
    final dark=SHelperFunctions.isDarkMode(context);
    return GestureDetector(onTap: (){
      Get.to(()=>ProductDetailScreen(product: product,));
    },
      child: Container(

        width: 150,
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.zero
        ,constraints: BoxConstraints(minHeight: 0),

        decoration: BoxDecoration(
          boxShadow: [SShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(SSizes.productImageRadius),
          color:dark?SColors.darkerGrey:SColors.lightGrey,
        ),
        child:  Column(mainAxisSize: MainAxisSize.min,
          children: [

            SRoundedContainer(height: 130,
              padding: EdgeInsets.all(SSizes.sm),
              backgroundColor: Colors.transparent,
                child: Stack(
                  children: [
                    //thumbnail,disccounttag
                   SizedBox(height:130,width: 130,
                       child:   SRoundedImage(isNetworkImage:true,imageUrl:product.imageUrl!,applyImageRadius: true,
                              height: 120,fit: BoxFit.cover,)),


                 //fav icon
                  Positioned(top:0,right: 0,
                child: Obx(() { // Obx observes the reactive variable
                  final bool isInWishlist = wishlistController.isProductInWishlist(product.id);
                  return SCircularIcon(icon: isInWishlist ? Icons.favorite : Icons.favorite_border,
                    color: isInWishlist ? Colors.red : Colors.grey,size:23 ,
                  onPressed: () {
                          wishlistController.toggleWishlist(product); // Call the toggle logic
                        },
                      );
                    })
                  ),
                  ],
                ),
              ),

            Padding(padding: EdgeInsets.only(left: SSizes.sm),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(product.brandname!,maxLines: 1,overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall,),
                SizedBox(height: SSizes.spaceBtwItem/6,),
                ProductTitleText(text: product.title),
                SizedBox(height: SSizes.spaceBtwItem/6,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.salePrice.toString(),maxLines: 1,overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineSmall,),

                    SCircularIcon(height:45,width:45,icon:Icons.add,color:Colors.black,size: 23,backgroundColor: Colors.grey, ),
                  ],
                )
              ],
            ),)
          ],
        ),
      ),
    );
  }
}










