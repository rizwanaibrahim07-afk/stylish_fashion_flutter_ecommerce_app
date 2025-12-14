import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/controllers/productbysub.dart';
import 'package:stylish_fashion/features/shop/controllers/productcontroller.dart';
import 'package:stylish_fashion/features/shop/model/subcategorymodel.dart';
import 'package:stylish_fashion/features/shop/screens/widgets/product/product_price_text.dart';
import 'package:stylish_fashion/features/shop/screens/widgets/product/product_title.dart';

import '../../../../common/icons/circular_icon.dart';
import '../../../../common/widgets/SVerticalimage/Sroundedimage.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helpers/helperfunctions.dart';
import '../../controllers/whishlistcontroller.dart';
import '../../model/product_model.dart';
import '../store/widgets/brand_title_text.dart';

class HorizontalProductCard extends StatelessWidget {
final ProductModel product;

final controller=Get.find<ProductsbySubCategoryController>();

   HorizontalProductCard({super.key, required this.product,
     });


  final WishlistController wishlistController = Get.put(WishlistController());
  @override
  Widget build(BuildContext context) {

    final discount=Productcontroller.instance.getDiscountPercent(product.price, product.salePrice!);

    final dark = SHelperFunctions.isDarkMode(context);

        return Container(
          width: 310,
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(SSizes.productImageRadius),
            color: dark ? SColors.darkerGrey : SColors.lightContainer,
          ),
          child:Row(
            children: [
              SRoundedContainer(
                height: 120,
                padding: EdgeInsets.all(SSizes.sm),
                backgroundColor: dark ? SColors.dark : SColors.white,
                child: Stack(
                  children: [
                    //thumbnail,
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: SRoundedImage(isNetworkImage: true,
                        imageUrl: product.imageUrl!,
                        applyImageRadius: true,
                      ),
                    ),
                    //discount tag
                    Positioned(
                      top: 12,
                      child: SRoundedContainer(
                        backgroundColor: Colors.yellowAccent,
                        child: Text(
                          '${discount.toStringAsFixed(0)}%OFF',
                          style: Theme.of(
                            context,
                          ).textTheme.labelMedium!.apply(color: Colors.black),
                        ),
                      ),
                    ),
                    //fav icon
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Obx(() { // Obx observes the reactive variable
                          final bool isInWishlist = wishlistController.isProductInWishlist(product.id);
                          return SCircularIcon(icon: isInWishlist ? Icons.favorite : Icons.favorite_border,
                            color: isInWishlist ? Colors.red : Colors.grey,size:23 ,
                            onPressed: () {
                              wishlistController.toggleWishlist(product); // Call the toggle logic
                            },
                          );})

                    ),
                  ],
                ),
              ),

              //details
              SizedBox(width: 172,
                child: Padding(
                  padding: const EdgeInsets.only(left: SSizes.sm,top: SSizes.sm),
                  child: Column(crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      Padding(padding: EdgeInsets.only(top: SSizes.sm,left: SSizes.sm)),
                      Column(

                        children: [
                          Padding(padding: EdgeInsets.only(top: SSizes.sm)),
                          ProductTitleText(text: product.title,),
                          SizedBox(height: SSizes.spaceBtwItem/2,),
                          SBrandTitleText(title: product.brandname!,),
                        ],
                      ),
                      Spacer(),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProductPriceText(price: '${product.salePrice}'),
                          SCircularIcon(icon:Icons.add,width:38,height:45,color:Colors.white,size: 23,backgroundColor: Colors.black, ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        );

  }
}
