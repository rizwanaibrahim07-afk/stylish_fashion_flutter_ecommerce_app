import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/controllers/productbysub.dart';
import 'package:stylish_fashion/features/shop/controllers/productcontroller.dart';
import 'package:stylish_fashion/features/shop/model/product_model.dart';
import 'package:stylish_fashion/features/shop/model/subcategorymodel.dart';
import 'package:stylish_fashion/features/shop/screens/all%20products/sorting_product.dart';
import 'package:stylish_fashion/features/shop/screens/widgets/vertical_product_card.dart';


import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/size.dart';
import '../../../common/layout/SGridlayout.dart';
import '../model/cart_item_model.dart';
class Filteredproduct extends StatelessWidget {
  final SubCategoryModel sub;

  Filteredproduct({super.key, required this.sub});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductsbySubCategoryController>();

    controller.loadProductswithSubCategory(sub.id);


    return Scaffold(
      appBar: SAppbar(title: Text(sub.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              // dropdown
              DropdownButtonFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.sort)),
                items: ['Name', 'High Price', 'Lower Price', 'Sale', 'Newest']
                    .map((option) =>
                    DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
                onChanged: (value) {},
              ),
              SizedBox(height: SSizes.spaceBtwItem),
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                if (controller.filteredproducts.isEmpty) {
                  return Center(
                      child: Text('No products found for ${sub.name}'));
                }

                return SGridlayout(
                  itemCount: controller.filteredproducts.length,
                  itemBuilder: (_, index) {
                    final products = controller.filteredproducts[index];
                    return SProductCardVertical(product: products);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}