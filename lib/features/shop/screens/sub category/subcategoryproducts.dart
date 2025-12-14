import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/model/product_model.dart';

import '../../../../common/widgets/ssectionheader.dart';
import '../../../../utils/constants/size.dart';
import '../../controllers/productbysub.dart';
import '../../model/cart_item_model.dart';
import '../../model/subcategorymodel.dart';
import '../filteredproduct.dart';
import '../widgets/horizontal_product_card.dart';

class subcategoryproducts extends StatelessWidget{
final controller=Get.put(ProductsbySubCategoryController());
  final SubCategoryModel sub;

   subcategoryproducts({
    super.key,
    required this.sub,
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ProductsbySubCategoryController(), tag: sub.id.toString(),);

    controller.loadProductswithSubCategory(sub.id);
    if (controller.filteredproducts.isEmpty) {
      controller.loadProductswithSubCategory(sub.id);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SSectionHeader(title: sub.name,
          actionButton: true,
          onPressed: () {
            Get.to(()=>Filteredproduct(sub: sub, ));
          },),

        GetX<ProductsbySubCategoryController>(
            tag: sub.id.toString(),
            builder: (specificController) {
    if (specificController.isLoading.value) {
    return Center(child: CircularProgressIndicator());
    }
    if (specificController.filteredproducts.isEmpty) {
      return Text('No products');
    }

    return
    SizedBox(height: 120,
                child: ListView.separated(
                    itemCount: specificController.filteredproducts.length > 4
                        ? 4
                        : specificController.filteredproducts.length, scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) =>
                        SizedBox(width: SSizes.spaceBtwItem,),
                    itemBuilder: (context, index) {
                      final product=specificController.filteredproducts[index];

                      return HorizontalProductCard(product:product);
                    }),

              );}),
      ],
    );
  }
}

