import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_data/controller/auth.dart';
import 'package:getx_firebase_data/controller/usercontroller.dart';
import 'package:getx_firebase_data/views/home.dart';
import 'package:getx_firebase_data/views/login.dart';

class Root extends GetWidget<Authcontroller> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<Authcontroller>().user != null) {
          return HomePage();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
