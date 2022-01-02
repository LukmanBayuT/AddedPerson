import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getx_firebase_data/models/user_models.dart';
import 'package:getx_firebase_data/models/userfull.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String? uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(uid).get();

      return UserModel.fromDocumentSnapshot(doc: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addToDo(String firstName, String lastName, String uid) async {
    try {
      await _firestore
          .collection("users")
          .doc(uid)
          .collection("userfullname")
          .add({
        'dateCreated': Timestamp.now(),
        'firstname': firstName,
        'lastname': lastName,
        'done': false
      });
    } catch (e) {}
  }

  Stream<List<UserFullModel>> userFullName(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("userfullname")
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<UserFullModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(UserFullModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }
}
