import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_data/controller/auth.dart';
import 'package:getx_firebase_data/views/signup.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends GetWidget<Authcontroller> {
  final TextEditingController emailcont = TextEditingController();
  final TextEditingController passwordcont = TextEditingController();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: const Color(0xff05050C),
        elevation: 0,
        title: Text(
          'Welcome!',
          style: GoogleFonts.archivo(fontSize: 24, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color(0xff05050C),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome, please put your username and password below',
                    style: GoogleFonts.archivo(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'If you have not had any, please consider registering',
                    style: GoogleFonts.archivo(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Thanks a lot!',
                    style: GoogleFonts.archivo(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: emailcont,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff23232e),
                        labelStyle: const TextStyle(color: Colors.white),
                        labelText: 'Email',
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff494959)),
                            borderRadius: BorderRadius.circular(16)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordcont,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff23232e),
                        labelStyle: const TextStyle(color: Colors.white),
                        labelText: 'Password',
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff494959)),
                            borderRadius: BorderRadius.circular(16)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 13,
                    child: OutlinedButton(
                      onPressed: () =>
                          controller.login(emailcont.text, passwordcont.text),
                      style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          side: const BorderSide(width: 2, color: Colors.white),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 13,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xff1e1e29),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () => Get.to(() => SignUp()),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
