import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns1229/Admin/helper.dart';
import 'package:ns1229/Admin/uploadimage.dart';
import 'package:ns1229/Admin/uploadnewpress.dart';
import 'package:ns1229/Admin/uploadvideo.dart';

class PIBProfileScreen extends StatefulWidget {
  const PIBProfileScreen({Key? key}) : super(key: key);

  @override
  State<PIBProfileScreen> createState() => _PIBProfileScreenState();
}

class _PIBProfileScreenState extends State<PIBProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //  onsIconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          "PIB Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
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
                      GestureDetector(
                        onTap: () {
                          Get.to(UploadNewPress());
                        },
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                              "Upload New Press",
                              overflow: TextOverflow.fade,
                              style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: .5),
                              ),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width - 40,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(UploadVideo());
                        },
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                              "Upload Video",
                              overflow: TextOverflow.fade,
                              style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: .5),
                              ),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width - 40,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(UploadImage());
                        },
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                              "Upload New Images",
                              overflow: TextOverflow.fade,
                              style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: .5),
                              ),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width - 40,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )
                    ],
                  ),
                  color: Colors.white,
                );
              });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red[800],
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Text(
                    "Name : Ramesh M S",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10),
                  child: Text(
                    "Department : Educational department",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 20, bottom: 20),
                  child: Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.red[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      "Past Activity",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1000,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("info")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return SizedBox();
                          }
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: 1000,
                                              child: Center(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                                Icons.edit)),
                                                        IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                                Icons.delete))
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              top: 12,
                                                              right: 8,
                                                              bottom: 2),
                                                      child: Text(
                                                        snapshot.data!
                                                                .docs[index]
                                                            ['title'],
                                                        overflow:
                                                            TextOverflow.fade,
                                                        style:
                                                            GoogleFonts.dmSans(
                                                          textStyle: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              letterSpacing:
                                                                  .5),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              right: 8),
                                                      child: Text(
                                                        snapshot.data!
                                                                .docs[index]
                                                            ['info'],
                                                        maxLines: 10,
                                                        overflow:
                                                            TextOverflow.fade,
                                                        style:
                                                            GoogleFonts.dmSans(
                                                          textStyle: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              letterSpacing:
                                                                  .5),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              width: 120,
                                              decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            );
                                          });
                                    },
                                    child: Container(
                                      height: 120,
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  top: 12,
                                                  right: 8,
                                                  bottom: 2),
                                              child: Text(
                                                snapshot.data!.docs[index]
                                                    ['title'],
                                                maxLines: 2,
                                                overflow: TextOverflow.fade,
                                                style: GoogleFonts.dmSans(
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: .5),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, right: 8),
                                              child: Text(
                                                snapshot.data!.docs[index]
                                                    ['info'],
                                                maxLines: 3,
                                                overflow: TextOverflow.fade,
                                                style: GoogleFonts.dmSans(
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      letterSpacing: .5),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                );
                              });
                        }),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
