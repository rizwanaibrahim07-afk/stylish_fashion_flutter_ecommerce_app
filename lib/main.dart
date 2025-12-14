import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'data/repositories/authentication_repository.dart';


Future<void> main() async {


  final WidgetsBinding widgetsBinding= WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Supabase.initialize(
    url:'https://vmmvqnetcrbeloxseoel.supabase.co' ,
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZtbXZxbmV0Y3JiZWxveHNlb2VsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTgyMzkyOTUsImV4cCI6MjA3MzgxNTI5NX0.BOqd-laj6tb3E2IEcrzg8YJu6HMZ-RWBCXzCJu7h72I',
  ).then((_)=>Get.put(AuthenticationRepository()));

  runApp(const MyApp());
}
