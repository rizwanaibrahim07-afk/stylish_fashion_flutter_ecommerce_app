import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/loaders/animatin_loader.dart';
import '../constants/colors.dart';
import '../helpers/helperfunctions.dart';
class SFullScreenLoader{
  static openLoadingDialog(String text,String animation){
    showDialog(context: Get.overlayContext!,//use Get.overlayContext for overlay dialogs
        barrierDismissible: false,  //the dialog cant be dismissed by tapping outside
        builder: (_)=>PopScope(
          canPop: false,  //disable popping with the back button
            child: Container(
              color: SHelperFunctions.isDarkMode(Get.context!)?SColors.dark:SColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 250,),
                  SAnimationLoader(text:text,animation:animation),

                ],
              ),
            ),
        ),);
  }
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}