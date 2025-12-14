import 'package:flutter/material.dart';
import 'package:stylish_fashion/features/authentication/screens/login_screen/widgets/formdivider.dart';
import 'package:stylish_fashion/features/authentication/screens/login_screen/widgets/formheader.dart';
import 'package:stylish_fashion/features/authentication/screens/login_screen/widgets/loginform.dart';
import 'package:stylish_fashion/features/authentication/screens/login_screen/widgets/socialfooter.dart';


import '../../../../utils/constants/size.dart';

import '../../../../utils/helpers/helperfunctions.dart';


  class LoginScreen extends StatelessWidget {
    const LoginScreen({super.key});

    @override
    Widget build(BuildContext context) {



      final dark = SHelperFunctions.isDarkMode(context);

      return Scaffold(
        resizeToAvoidBottomInset: true,
      body: SafeArea(child:SingleChildScrollView(
      child: Container(
      padding: const EdgeInsets.all(SSizes.defaultSpace),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormHeaderWidget( title1: 'Stylish Fashion',
          title: 'Welcome Back', subTitle: 'Discover Limitless Choices'),
      Loginform(),
       FormDividerWidget(),
      SocialFooter(),
      ],
      ),
      ),
      ),
      ),
      );
      }
      }


