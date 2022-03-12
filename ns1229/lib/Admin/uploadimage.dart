import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ns1229/Admin/api.dart';
import 'package:path/path.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  TextEditingController infocontroller = TextEditingController();
  UploadTask? task;

  ImagePicker picker = ImagePicker();
  var _img;
  String? imageUrl;
  File? file;
  TextEditingController titlecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Upload Image',
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
              _img != null
                  ? Image.file(
                      _img,
                      width: MediaQuery.of(context).size.width - 40,
                      height: 200.0,
                      fit: BoxFit.cover,
                    )
                  : SizedBox(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      // final result = await FilePicker.platform
                      //     .pickFiles(allowMultiple: false);

                      // if (result == null) return;
                      // final path = result.files.single.path!;

                      // setState(() {
                      //   file = File(path);
                      // });
                      XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        _img = File(image!.path);
                        print(_img);
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
                        "Select Image",
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
                          final _firebaseStorage = FirebaseStorage.instance;

                          var snapshot = await _firebaseStorage
                              .ref()
                              .child(_img.toString())
                              .putFile(_img);
                          var downloadUrl = await snapshot.ref.getDownloadURL();
                          setState(() {
                            imageUrl = downloadUrl;
                            print('Download-Link: $imageUrl');
                          });

                          FirebaseFirestore.instance
                              .collection("images")
                              .doc()
                              .set({
                            "image": imageUrl,
                            "name": titlecontroller.text
                          });
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
