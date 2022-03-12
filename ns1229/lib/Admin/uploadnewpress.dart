import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UploadNewPress extends StatefulWidget {
  const UploadNewPress({Key? key}) : super(key: key);

  @override
  State<UploadNewPress> createState() => _UploadNewPressState();
}

class _UploadNewPressState extends State<UploadNewPress> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController infocontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  onsIconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          "Upload New Press",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width - 30,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TextField(
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  cursorColor: Colors.black,
                  controller: titlecontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    labelText: 'Title',
                    labelStyle: TextStyle(
                        fontFamily: 'lato',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black54),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                height: 205,
                width: MediaQuery.of(context).size.width - 30,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TextField(
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    cursorColor: Colors.black,
                    controller: infocontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      labelText: 'Description',
                      labelStyle: TextStyle(
                          fontFamily: 'lato',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black54),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                FirebaseFirestore.instance.collection("info").doc().set({
                  "info": infocontroller.text,
                  "title": titlecontroller.text
                }).whenComplete(() {
                  Navigator.pop(context);
                });
              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.red[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                  "Upload Activity",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
