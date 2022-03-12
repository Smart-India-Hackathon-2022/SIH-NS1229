import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns1229/Admin/api.dart';
import 'package:path/path.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({Key? key}) : super(key: key);

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  TextEditingController infocontroller = TextEditingController();
  UploadTask? task;
  File? file;
  TextEditingController titlecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Upload Video',
            style: GoogleFonts.dmSans(
              textStyle: TextStyle(
                  color: Colors.white, fontSize: 17, letterSpacing: .5),
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: Column(
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
              Container(
                height: 45,
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
                      labelText: 'Youtube URL',
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
              GestureDetector(
                onTap: () {
                  FirebaseFirestore.instance.collection("videos").doc().set({
                    "url": infocontroller.text,
                    "name": titlecontroller.text
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
                    "Upload",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'or',
                style: GoogleFonts.dmSans(
                  textStyle: TextStyle(
                      color: Colors.black, fontSize: 17, letterSpacing: 0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final result = await FilePicker.platform
                          .pickFiles(allowMultiple: false);

                      if (result == null) return;
                      final path = result.files.single.path!;

                      setState(() => file = File(path));
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
                        "Select Video",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.green[200],
                    child: IconButton(
                        onPressed: () async {
                          if (file == null) return;

                          final fileName = basename(file!.path);
                          final destination = 'files/$fileName';

                          task = FirebaseApi.uploadFile(destination, file!);
                          setState(() {});

                          if (task == null) return;

                          final snapshot = await task!.whenComplete(() {});
                          final urlDownload =
                              await snapshot.ref.getDownloadURL();

                          print('Download-Link: $urlDownload');
                        },
                        icon: Icon(Icons.upload)),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              task != null ? buildUploadStatus(task!) : Container(),
            ],
          ),
        ));
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            );
          } else {
            return Container();
          }
        },
      );
}
