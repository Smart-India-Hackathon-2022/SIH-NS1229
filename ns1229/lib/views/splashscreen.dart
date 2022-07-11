import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_animations/im_animations.dart';
import 'package:ns1229/Admin/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
 
    Timer(const Duration(seconds: 5), () {
      Get.to(const PIBLogin());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width ,
              child: Fade(
              duration: const Duration(seconds: 5),
                   
            
            fadeEffect: FadeEffect.fadeIn,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/logo.png"),
                    const SizedBox(width: 20),
                     Column(
            
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                    'Press Information Bureau',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                              color: Colors.black, fontSize: 23, letterSpacing: 0),
                    ),
                  ),
                   Row(
                     children: [
                       Text(
                        'Government of India',
                        
                        style: GoogleFonts.dmSans(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                  color: Colors.black, fontSize: 20, letterSpacing: 0),
                        ),
                  ),
                     ],
                   ),
                   
                   
                       ],
                     ),
                  ],
                )),
            ),
            const Spacer(),
            Text(
                    'Ministry of Information & Broadcasting',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.dmSans(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                              color: Colors.black, fontSize: 14, letterSpacing: 0),
                    ),
                  ),
                  const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
