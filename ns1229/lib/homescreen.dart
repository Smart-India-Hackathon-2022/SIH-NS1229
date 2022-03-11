import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns1229/Admin/adminpanel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String typeselected = "News";
  String selectedtype = "News";
  String selectedcategory = "All Ministry";
  List dept = [
    "All Ministry",
    "Cabinet",
    "Ministry of Culture",
    "Ministry of Defence",
    "Ministry of Education",
    "Ministry of Finance",
    "Ministry of Health"
  ];
  bool newsselected = false;
  bool videoselected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Naveena",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              title: Text(
                'Notification',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Themes',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              onTap: () {},
            ),
            Spacer(),
            ListTile(
              title: Text(
                'Logout',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AdminPanel()));
                  },
                  child: Icon(Icons.search)))
        ],
        backgroundColor: Colors.black,
        title: Text(
          'Press Information Bureau',
          style: GoogleFonts.dmSans(
            textStyle: TextStyle(color: Colors.white, letterSpacing: .5),
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              '    Live Events :',
              style: GoogleFonts.dmSans(
                textStyle: TextStyle(
                    color: Colors.black, fontSize: 16, letterSpacing: .5),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 96,
                    child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 80,
                              width: 80,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  height: 70,
                                  width: 70,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Colors.red.shade900,
                                        Colors.red.shade100,
                                      ])),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  '    Upcoming Events :',
                  style: GoogleFonts.dmSans(
                    textStyle: TextStyle(
                        color: Colors.black, fontSize: 16, letterSpacing: .5),
                  ),
                ),
                Spacer(),
                Text(
                  '    View All    ',
                  style: GoogleFonts.dmSans(
                    textStyle: TextStyle(
                        color: Colors.black54, fontSize: 12, letterSpacing: .5),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Events")
                      .snapshots(),
                  builder: (context, snapshots) {
                    if (snapshots.data == null) {
                      return SizedBox();
                    }
                    return ListView.builder(
                        itemCount: snapshots.data!.size,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 8, right: 8),
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  borderRadius: BorderRadius.circular(8)),
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      snapshots.data!.docs[index]['name'],
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Spacer(),
                                    Text(
                                      snapshots.data!.docs[index]['time'],
                                      style: TextStyle(
                                          color: Colors.black45, fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }),
              height: 150,
            ),
            SizedBox(
              height: 10,
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedtype = "News";
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      color: selectedtype == "News"
                          ? Colors.red[900]
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      "News",
                      style: TextStyle(
                          color: selectedtype == "News"
                              ? Colors.white
                              : Colors.black),
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedtype = "Images";
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      color: selectedtype == "Images"
                          ? Colors.red[900]
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      "Images",
                      style: TextStyle(
                          color: selectedtype == "Images"
                              ? Colors.white
                              : Colors.black),
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedtype = "Videos";
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      color: selectedtype == "Videos"
                          ? Colors.red[900]
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      "Videos",
                      style: TextStyle(
                          color: selectedtype == "Videos"
                              ? Colors.white
                              : Colors.black),
                    )),
                  ),
                ),
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Text(
              '     Latest ' + selectedtype,
              style: GoogleFonts.dmSans(
                textStyle: TextStyle(
                    color: Colors.black, fontSize: 17, letterSpacing: .5),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 55,
              child: StreamBuilder(
                  stream:
                      FirebaseFirestore.instance.collection("info").snapshots(),
                  builder: (context, snapshots) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dept.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedcategory = dept[index];
                                });
                              },
                              child: Container(
                                height: 50,
                                child: Center(
                                  child: Text(
                                    dept[index].toString(),
                                    style: GoogleFonts.dmSans(
                                      textStyle: TextStyle(
                                          color: selectedcategory == dept[index]
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 14,
                                          letterSpacing: 0),
                                    ),
                                  ),
                                ),
                                width: 160,
                                decoration: BoxDecoration(
                                    color: selectedcategory == dept[index]
                                        ? Colors.red[900]
                                        : Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          );
                        });
                  }),
            ),
            Expanded(
              child: Container(
                height: 1000,
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("info")
                        .snapshots(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
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
                                          snapshot.data!.docs[index]['title'],
                                          maxLines: 2,
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
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8),
                                        child: Text(
                                          snapshot.data!.docs[index]['info'],
                                          maxLines: 3,
                                          overflow: TextOverflow.fade,
                                          style: GoogleFonts.dmSans(
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal,
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
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            );
                          });
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
