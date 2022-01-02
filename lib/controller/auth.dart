import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_data/controller/usercontroller.dart';
import 'package:getx_firebase_data/models/user_models.dart';
import 'package:getx_firebase_data/service/database.dart';
import 'package:getx_firebase_data/views/home.dart';
import 'package:getx_firebase_data/views/login.dart';

class Authcontroller extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;

  ///we have to validate the _user using authStateChanged() which is newer version of onAuthStateChanged and its now a methods
  @override
  onInit() {
    _user.bindStream(_auth.authStateChanges());
  }

  ///we create 3 func create, login & SignUp
  ///on create and login we need email and Password as String
  void createUser(String name, String email, String password) async {
    ///we build try n catch because we will build a future
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

      ///create user with firestore
      UserModel _user =
          UserModel(id: _authResult.user!.uid, email: email, name: name);
      if (await Database().createNewUser(_user)) {
        Get.offAll(HomePage());
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Mohon masukan email dan password", e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential _authresult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      await Database().getUser(_authresult.user?.uid);
      Get.offAll(HomePage());
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
          "Mohon masukan valid email dan password", e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.offAll(LoginScreen());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Gagal, mohon tunggu sebentar", e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
