
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/SVerticalimage/Sroundedimage.dart';
import '../../../../common/widgets/custom_shapes/containers/circularcontainer.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../controllers/homecontroller.dart';
class SpromoSlider extends StatelessWidget {
  const SpromoSlider({
    super.key, required this.banners,
  });
 final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(items:banners.map((url)=>SRoundedImage(imageUrl: url)).toList(),
         options:CarouselOptions(autoPlay: true,autoPlayInterval: Duration(seconds: 3),autoPlayAnimationDuration: Duration(milliseconds: 800),
            onPageChanged: (index,_)=>controller.updatePageIndicator(index),
            viewportFraction: 1),

        ),
        SizedBox(height: SSizes.spaceBtwItem),
     Center(
       child: Obx(() =>  Row(mainAxisSize: MainAxisSize.min,
           children: [
            for(int i=0;i<3;i++)SCircularContainer(
              width: 20,height: 5,
              backgroundcolor: controller.carouselCurrentIndex.value==i?SColors.primary:SColors.grey
              ,margin: EdgeInsets.only(right: 10),
            ),])),
     )

      ],
    );
  }
}
