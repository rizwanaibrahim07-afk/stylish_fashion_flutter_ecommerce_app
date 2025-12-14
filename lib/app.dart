import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/utils/constants/colors.dart';
import 'package:stylish_fashion/utils/theme/theme.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'bindings/general_binding.dart';
import 'features/authentication/screens/newpasswordreset.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // Listen for auth state changes to handle password recovery links
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      if (data.event == AuthChangeEvent.passwordRecovery) {
        // Navigate to the password reset screen when the link is clicked
        Get.to(()=>NewpasswordresetScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: SAppTheme.lightTheme,
      darkTheme: SAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home:const Scaffold(backgroundColor: SColors.primary ,
          body:Center(child: CircularProgressIndicator(color:Colors.white ))),
    );
  }
}
