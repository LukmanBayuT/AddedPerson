import 'package:get/get.dart';
import 'package:getx_firebase_data/controller/auth.dart';
import 'package:getx_firebase_data/controller/auth.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Authcontroller>(Authcontroller(), permanent: true);

    // Get.put<AuthController>(AuthController(), permanent: true);
  }
}
