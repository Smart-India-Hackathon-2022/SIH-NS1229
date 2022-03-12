import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ns1229/Admin/adminpanel.dart';
import 'package:ns1229/Admin/department.dart';
import 'package:ns1229/Admin/login.dart';
import 'package:ns1229/Admin/loginscreen.dart';
import 'package:ns1229/homescreen.dart';

import '../Admin/pibprofilescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 3), () {
      Get.to(const LoginScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network("https://i.ibb.co/4RcfSPq/344.png"),
      ),
    );
  }
}
