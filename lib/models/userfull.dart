import 'package:cloud_firestore/cloud_firestore.dart';

class UserFullModel {
  late String firstname, lastname;
  late Timestamp dateCreated;
  UserFullModel(
      {required this.firstname,
      required this.lastname,
      required this.dateCreated});

  UserFullModel.fromDocumentSnapshot(
      DocumentSnapshot<dynamic> documentSnapshot) {
    firstname = documentSnapshot.data()!['lastname'];
    lastname = documentSnapshot.data()!['firstname'];
    dateCreated = documentSnapshot.data()!['dateCreated'];
  }
}
