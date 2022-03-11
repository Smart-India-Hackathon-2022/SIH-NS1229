import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns1229/homescreen.dart';

class DepartmentPage extends StatefulWidget {
  const DepartmentPage({Key? key}) : super(key: key);

  @override
  State<DepartmentPage> createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  String? _chosenValue;
  String? _chosenLan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 80,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text(
                      'Press Information Bureau',
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            letterSpacing: .5,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'Govt of India',
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            letterSpacing: .5,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 5, bottom: 5),
                child: DropdownButton<String>(
                  underline: SizedBox(),
                  focusColor: Colors.white,
                  value: _chosenValue,
                  borderRadius: BorderRadius.circular(10),
                  elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items: <String>[
                    'PIB Mumbai',
                    'PIB Delhi',
                    'PIB Chennai',
                    'PIB Kolkata',
                    'PIB Guwahati',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  hint: const Text(
                    "Please Region ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _chosenValue = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 5, bottom: 5),
                child: DropdownButton<String>(
                  underline: SizedBox(),
                  focusColor: Colors.white,
                  value: _chosenLan,
                  borderRadius: BorderRadius.circular(10),
                  elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items: <String>[
                    'Tamil',
                    'English',
                    'Hindi',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  hint: const Text(
                    "Select Language",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _chosenLan = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Get.to(HomeScreen());
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange[100]),
                child: Center(
                  child: Text(
                    'Proceed',
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          letterSpacing: .5,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
