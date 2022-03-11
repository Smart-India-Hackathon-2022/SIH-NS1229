import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';

import 'api.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  TextEditingController titlecontroller = TextEditingController();
  ImagePicker picker = ImagePicker();
  UploadTask? task;
  File? file;

  var _img;
  String? imageUrl;
  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Upload News',
          style: GoogleFonts.dmSans(
            textStyle:
                TextStyle(color: Colors.white, fontSize: 17, letterSpacing: .5),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      // ignore: prefer_const_constructors
                      _img != null
                          ? Image.file(
                              _img,
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.fitHeight,
                            )
                          : SizedBox(),
                      SizedBox(
                        width: 10,
                      ),
                      // ignore: prefer_const_constructors
                      IconButton(
                          onPressed: () async {
                            XFile? image = await picker.pickImage(
                                source: ImageSource.camera);
                            setState(() {
                              _img = File(image!.path);
                              print(_img);
                            });
                          },
                          icon: Icon(
                            Icons.camera,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        print("dj");
                        selectFile();
                      },
                      icon: Icon(
                        Icons.video_call,
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  task != null ? buildUploadStatus(task!) : Container(),
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
                    height: 205,
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
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(
                          'National',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                letterSpacing: .5),
                          ),
                        )),
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(40)),
                        width: 100,
                      ),
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(
                          'Politics',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                letterSpacing: .5),
                          ),
                        )),
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(40)),
                        width: 100,
                      ),
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(
                          'Technology',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                letterSpacing: .5),
                          ),
                        )),
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(40)),
                        width: 100,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(
                          'Education',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                letterSpacing: .5),
                          ),
                        )),
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(40)),
                        width: 100,
                      ),
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(
                          'Entertainment',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                letterSpacing: .5),
                          ),
                        )),
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(40)),
                        width: 100,
                      ),
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(
                          'State',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                letterSpacing: .5),
                          ),
                        )),
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(40)),
                        width: 100,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      // final _firebaseStorage = FirebaseStorage.instance;

                      // var snapshot = await _firebaseStorage
                      //     .ref()
                      //     .child(_img.toString())
                      //     .putFile(_img);
                      // var downloadUrl = await snapshot.ref.getDownloadURL();
                      // setState(() {
                      //   imageUrl = downloadUrl;
                      //   print(imageUrl);

                      // });
                      uploadFile();
                    },
                    child: Container(
                      height: 40,
                      child: Center(
                          child: Text(
                        'Upload News',
                        style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              letterSpacing: .5),
                        ),
                      )),
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(40)),
                      width: 200,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
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
                  color: Colors.white),
            );
          } else {
            return Container();
          }
        },
      );
}
