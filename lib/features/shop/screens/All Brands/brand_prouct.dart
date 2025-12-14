import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/size.dart';
import '../all products/sorting_product.dart';
import '../store/widgets/brand_card.dart';
class BrandProuct extends StatelessWidget {
  const BrandProuct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppbar(title: Text('Adidas'),),
      body: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              SBrandCard(showBorder: true),
              SizedBox(height: SSizes.spaceBtwSections,),

            ],
          ),),
      ),
    );
  }
}
