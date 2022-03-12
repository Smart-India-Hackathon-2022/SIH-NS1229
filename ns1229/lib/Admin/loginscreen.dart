import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ns1229/Admin/register.dart';
import 'package:ns1229/homescreen.dart';

import '../views/forgotpassword.dart';
import 'alertdialog.dart';
import 'helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _password = true;
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController resetemailtexteditingcontroller =
      new TextEditingController();
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
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Container(
                height: 130,
                child: Image.network("https://i.ibb.co/4RcfSPq/344.png"),
              ),
            ),
            Text(
              "LOGIN",
              style: GoogleFonts.dmSans(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 14,
                    letterSpacing: 2),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Please Enter Your e-mail and password",
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
                  controller: passwordcontroller,
                  obscureText: !_password,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(
                          _password ? Icons.visibility : Icons.visibility_off,
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
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Route route =
                    MaterialPageRoute(builder: (context) => ForgetPassword());
                Navigator.push(context, route);
              },
              child: Text(
                "Forget Password ?",
                style: GoogleFonts.dmSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black45,
                      fontSize: 14,
                      letterSpacing: 0),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                emailcontroller.text.isNotEmpty &&
                        passwordcontroller.text.isNotEmpty
                    ? _loginform()
                    : showDialog(
                        context: context,
                        builder: (c) {
                          return ErrorAlertDialog(
                              message: "Provide Email and Password");
                        });
              },
              child: Container(
                height: 45,
                width: 100,
                child: Center(
                  child: Text(
                    "LOGIN",
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
                  color: Colors.red[900],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account ?",
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
                    Get.to(RegisterScreen());
                  },
                  child: Text(
                    " Create one",
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
    ));
  }

  Future<void> _loginform() async {
    User firebaseUser;
    await auth
        .signInWithEmailAndPassword(
            email: emailcontroller.text, password: passwordcontroller.text)
        .then((authUser) {
      var snackBar = SnackBar(
          backgroundColor: Colors.white,
          content: Container(
            height: 20,
            child: Center(
                child: Text(
              'LoggedIn Successfully',
              style: TextStyle(color: Colors.black, letterSpacing: 1),
            )),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      firebaseUser = authUser.user!;
      readData(firebaseUser);
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(
              message: error.message.toString(),
            );
          });
    });
  }

  readData(User fUser) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(fUser.uid)
        .get()
        .then((dataSnapshot) async {
      // MRANDMRS.firestore
      //     .collection("users")
      //     .doc(fUser.uid)
      //     .collection("CartItems")
      //     .get()
      //     .then((value) => value.docs.forEach((element) async {
      //           await MRANDMRS.sharedPreferences.setString(
      //               element.data()["title"],
      //               element.data()["Quantity"].toString());
      //           print(element.data()["title"]);

      //           print(element.data());
      //         }));
      await MRANDMRS.sharedprefs!.setString("uid", dataSnapshot.data()!["uid"]);
      await MRANDMRS.sharedprefs!
          .setString("email", dataSnapshot.data()!["email"]);
      await MRANDMRS.sharedprefs!
          .setString("name", dataSnapshot.data()!["name"]);
    }).whenComplete(() {
      Route route = MaterialPageRoute(builder: (context) => HomeScreen());
      Navigator.pushReplacement(context, route);
    });
  }
}
