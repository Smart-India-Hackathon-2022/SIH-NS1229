import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ns1229/Admin/department.dart';
import 'package:ns1229/Admin/loginscreen.dart';
import 'package:ns1229/homescreen.dart';

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
      Get.to(const DepartmentPage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
            "https://i.ibb.co/yBVKFkN/Whats-App-Image-2022-03-11-at-6-45-19-PM.jpg"),
      ),
    );
  }
}
