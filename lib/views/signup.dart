import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_data/controller/auth.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends GetWidget<Authcontroller> {
  TextEditingController namecont = TextEditingController();
  TextEditingController emailcont = TextEditingController();
  TextEditingController passwordcont = TextEditingController();
  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff05050C),
        elevation: 0,
        title: const Text('SignUp'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xff05050C),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Please fill the form below',
                      style: GoogleFonts.archivo(fontSize: 12),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Thanks',
                      style: GoogleFonts.archivo(fontSize: 12),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: namecont,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xff23232e),
                          labelStyle: const TextStyle(color: Colors.white),
                          labelText: 'Nama',
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff494959)),
                              borderRadius: BorderRadius.circular(16)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                    ),
                    const SizedBox(
                      height: 15,
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
                      height: 15,
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
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            primary: Colors.white,
                            side:
                                const BorderSide(width: 2, color: Colors.white),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          controller.createUser(
                              namecont.text, emailcont.text, passwordcont.text);
                        },
                        child: const Text(
                          'Daftar',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
