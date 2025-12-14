import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/image_string.dart';

class HomeController extends GetxController{
  static HomeController get  instance=>Get.find();
  Timer? timer;
  final carouselCurrentIndex=0.obs;


  @override

  void updatePageIndicator(index){
    carouselCurrentIndex.value=index;
  }



}