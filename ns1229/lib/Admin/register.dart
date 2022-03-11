import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns1229/Admin/loginscreen.dart';
import 'package:ns1229/homescreen.dart';

import 'alertdialog.dart';
import 'helper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _password = true;
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController namecontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();
  @override
  void initState() {
    super.initState();
    _password = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 150,
                    child: Image.network(
                        "https://i.ibb.co/yBVKFkN/Whats-App-Image-2022-03-11-at-6-45-19-PM.jpg"),
                  ),
                  Text(
                    "REGISTER",
                    style: GoogleFonts.dmSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 14,
                          letterSpacing: 2),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Please fill in the information below:",
                    style: GoogleFonts.dmSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 14,
                          letterSpacing: 0.5),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 45,
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        cursorColor: Colors.black,
                        controller: namecontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelText: 'Name',
                          labelStyle: TextStyle(
                              fontFamily: 'lato',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54),
                        ),
                      ),
                    ),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 45,
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        cursorColor: Colors.black,
                        controller: emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              fontFamily: 'lato',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54),
                        ),
                      ),
                    ),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 45,
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        cursorColor: Colors.black,
                        controller: passwordcontroller,
                        obscureText: !_password,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(
                                _password
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                                size: 18),
                            onPressed: () {
                              setState(() {
                                _password = !_password;
                              });
                            },
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              fontFamily: 'lato',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54),
                        ),
                      ),
                    ),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      emailcontroller.text.isNotEmpty &&
                              passwordcontroller.text.isNotEmpty &&
                              namecontroller.text.isNotEmpty
                          ? _Registerform()
                          : showDialog(
                              context: context,
                              builder: (c) {
                                return ErrorAlertDialog(
                                    message: "Fill Completely");
                              });
                    },
                    child: Container(
                      height: 45,
                      width: 400,
                      child: Center(
                        child: Text(
                          "CREATE ACCOUNT",
                          style: GoogleFonts.dmSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontSize: 14,
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(204, 191, 171, 1),
                          border: Border.all(
                              color: Color.fromRGBO(204, 191, 171, 1))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account ?",
                        style: GoogleFonts.dmSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black45,
                              fontSize: 14,
                              letterSpacing: 0),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(LoginScreen());
                        },
                        child: Text(
                          " Login",
                          style: GoogleFonts.dmSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 14,
                                letterSpacing: 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            color: Colors.white));
  }

  Future<void> _Registerform() async {
    User firebaseUser;
    await auth
        .createUserWithEmailAndPassword(
            email: emailcontroller.text, password: passwordcontroller.text)
        .then((authUser) {
      var snackBar = SnackBar(
          backgroundColor: Colors.white,
          content: Container(
            height: 20,
            child: Center(
                child: Text(
              'Account Created Successfully',
              style: TextStyle(color: Colors.black, letterSpacing: 1),
            )),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      firebaseUser = authUser.user!;
      FirebaseFirestore.instance.collection("users").doc(firebaseUser.uid).set({
        "uid": firebaseUser.uid,
        "email": firebaseUser.email,
        "name": namecontroller.text.trim(),
      });
      MRANDMRS.sharedprefs?.setString("uid", firebaseUser.uid);
      MRANDMRS.sharedprefs?.setString("email", firebaseUser.email.toString());
      MRANDMRS.sharedprefs
          ?.setString("name", namecontroller.text)
          .then((value) {
        Route route = MaterialPageRoute(builder: (context) => HomeScreen());
        Navigator.pushReplacement(context, route);
      });
    });
  }
}
