import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_data/controller/binding/auth_binding.dart';
import 'package:getx_firebase_data/util/root.dart';
import 'package:getx_firebase_data/views/home.dart';
import 'package:getx_firebase_data/views/login.dart';

void main() async {
  ///i really don't know how this works but its work, thanks firebase!
  WidgetsFlutterBinding.ensureInitialized();

  ///dont forget to init firebase app
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ///don't forget to put binding inside because this firebase need to binds a lot
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      theme: ThemeData.dark(),
      home: LoginScreen(),
    );
  }
}
