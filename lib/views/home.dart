import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getx_firebase_data/controller/auth.dart';
import 'package:getx_firebase_data/controller/streamuser.dart';
import 'package:getx_firebase_data/service/database.dart';

import 'package:google_fonts/google_fonts.dart';

class HomePage extends GetWidget<Authcontroller> {
  final TextEditingController _firstNameCont = TextEditingController();
  final TextEditingController _lastNameCont = TextEditingController();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff05050C),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                controller.signOut();
              },
              icon: const Icon(Icons.logout_outlined))
        ],
        title: const Text('List Person'),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color(0xff05050C),
        child: Column(
          children: [
            const Text(
              'Add User',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'First Name'),
                      controller: _firstNameCont,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'Last Name'),
                      controller: _lastNameCont,
                    ),
                    IconButton(
                        onPressed: () {
                          if (_firstNameCont.text + _lastNameCont.text != "") {
                            Database().addToDo(_firstNameCont.text,
                                _lastNameCont.text, controller.user!);
                            _firstNameCont.clear();
                            _lastNameCont.clear();
                          }
                        },
                        icon: const Icon(Icons.add)),
                  ],
                ),
              ),
            ),
            Text(
              'Your Added Person List',
              style: GoogleFonts.archivo(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            GetX<TodoController>(
                init: Get.put(TodoController()),
                builder: (TodoController todoController) {
                  if (todoController != null &&
                      todoController.userFullName != null) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: todoController.userFullName?.length,
                          itemBuilder: (_, index) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      todoController
                                          .userFullName![index].lastname,
                                      style: GoogleFonts.archivo(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      todoController
                                          .userFullName![index].firstname,
                                      style: GoogleFonts.archivo(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  } else {
                    return Text('No Data');
                  }
                })
          ],
        ),
      ),
    );
  }
}
