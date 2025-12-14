import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:stylish_fashion/features/shop/controllers/cart_controller.dart';
import 'package:stylish_fashion/features/shop/controllers/productcontroller.dart';
import 'package:stylish_fashion/features/shop/model/cart_item_model.dart';
import 'package:stylish_fashion/features/shop/model/product_model.dart';
import 'package:stylish_fashion/features/shop/screens/widgets/product/product_price_metadata.dart';


import '../../../../../common/styles/choic_chips.dart';
import '../../../../../common/widgets/Scurvededgewidget.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/ssectionheader.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_string.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helpers/helperfunctions.dart';
import '../../cart/cart_screen.dart';
import 'bottom_add_to_cart.dart';
class ProductDetailScreen extends StatelessWidget {
  final productcontroller=Get.find<Productcontroller>();
  final cartcontroller=Get.find<CartController>();
  final ProductModel product;
   ProductDetailScreen({super.key, required this.product, });
final controller=Get.put(Productcontroller());
  @override
  Widget build(BuildContext context) {

    final dark=SHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: SBottomAddToCart(item:product ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              //image
              ScurvedEdgeWidget(
                child: Container(
                  color: dark?SColors.darkGrey:SColors.light,
                  child:  SizedBox(height: 400,
                    child: Padding(padding: EdgeInsets.all(SSizes.productImageRadius),
                        child: Center(child: Image(image: NetworkImage(product.imageUrl!)),)),
                  ),
                ),
              ),
              //product title
              Row(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.title,style: Theme.of(context).textTheme.titleLarge,),
                  SRoundedContainer(backgroundColor: SHelperFunctions.isDarkMode(context)
                      ?SColors.dark:SColors.light,child:
                  IconButton(onPressed: (){}, icon: Icon(Icons.share)),),
                ],
              ),
              Text(product.brandname!,style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height:SSizes.spaceBtwSections),
              Productmetadata(product:product),
              //
              Divider(),
              //Attributes
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SSectionHeader(title: 'Color',actionButton: false,),

              SizedBox(height: SSizes.spaceBtwItem/2,),
                  Wrap(
                    children: [
                    SChoiceChip(text: 'White', selected: true,onSelected:(value){},),

                  ],),
                  //size
                  const SizedBox(height: SSizes.spaceBtwItem,),
                  SSectionHeader(title: 'Size',actionButton: false,),

                  SizedBox(height: SSizes.spaceBtwItem/2,),
                  Obx(
    (){ return Wrap(spacing: 10,
                        children:product.sizes!.map((size){
                      final bool isSelected=controller.selectedsize.value==size;
                     return  SChoiceChip(text:size , selected:isSelected,
                            onSelected:(value){controller.selectedSize(size);},);}).toList());})





                  ,const SizedBox(height: SSizes.spaceBtwItem,),
                  SizedBox(width: double.infinity,child:
                  ElevatedButton(onPressed: (){CartController.instance.addToCart(product);
                    Get.to(()=>CartScreen());}, child: Text('Add to Bag')),),
                  Divider(),
                  SSectionHeader(title: 'Description',actionButton: false,),
                  const SizedBox(height: SSizes.spaceBtwItem,),
                  ReadMoreText(product.description!,
                  trimLines: 2,trimMode: TrimMode.Line,trimCollapsedText:' show more',trimExpandedText: 'less',
                  moreStyle: const TextStyle(fontSize: 14,fontWeight:FontWeight.w600), lessStyle: const TextStyle(fontSize: 14,fontWeight:FontWeight.w600),)

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

