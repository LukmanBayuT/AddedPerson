import 'package:get/get.dart';
import 'package:getx_firebase_data/controller/auth.dart';
import 'package:getx_firebase_data/models/userfull.dart';
import 'package:getx_firebase_data/service/database.dart';

class TodoController extends GetxController {
  Rxn<List<UserFullModel>> userfullname = Rxn<List<UserFullModel>>();

  List<UserFullModel>? get userFullName => userfullname.value;

  @override
  void onInit() {
    String? uid = Get.find<Authcontroller>().user;
    userfullname.bindStream(Database().userFullName(uid!));
  }
}
