import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns1229/Admin/adminpanel.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String typeselected = "Press";
  String selectedtype = "Press";
  String selectedcategory = "All Ministry";
  PageController pageController = PageController();
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
        backgroundColor: Colors.blueGrey[900],
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Text(
              'Press Information Burea',
              style: GoogleFonts.dmSans(
                textStyle: TextStyle(
                    color: Colors.white, fontSize: 18, letterSpacing: .5),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
              child: Container(
                height: 1,
                width: MediaQuery.of(context).size.width - 100,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '   Home',
                  style: GoogleFonts.dmSans(
                    textStyle: TextStyle(
                        color: Colors.white, fontSize: 18, letterSpacing: .5),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
              child: Container(
                height: 0.5,
                width: MediaQuery.of(context).size.width - 100,
                color: Colors.grey[200],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '   Gallery',
                  style: GoogleFonts.dmSans(
                    textStyle: TextStyle(
                        color: Colors.white, fontSize: 18, letterSpacing: .5),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
              child: Container(
                height: 0.5,
                width: MediaQuery.of(context).size.width - 100,
                color: Colors.grey[200],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '   Events',
                  style: GoogleFonts.dmSans(
                    textStyle: TextStyle(
                        color: Colors.white, fontSize: 18, letterSpacing: .5),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
              child: Container(
                height: 0.5,
                width: MediaQuery.of(context).size.width - 100,
                color: Colors.grey[200],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '   Videos',
                  style: GoogleFonts.dmSans(
                    textStyle: TextStyle(
                        color: Colors.white, fontSize: 18, letterSpacing: .5),
                  ),
                ),
              ],
            ),
            Spacer(),
            ListTile(
              title: Text(
                'PIB India',
                style: TextStyle(color: Colors.white, fontSize: 15),
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
        backgroundColor: Colors.blueGrey[900],
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
                    height: 76,
                    child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 60,
                              width: 60,
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
                      selectedtype = "Press";
                      pageController.animateToPage(0,
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      color: selectedtype == "Press"
                          ? Colors.red[900]
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      "Press",
                      style: TextStyle(
                          color: selectedtype == "Press"
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
                      pageController.animateToPage(1,
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
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
                      pageController.animateToPage(2,
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
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
              child: PageView(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
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
                                                    fontWeight: FontWeight.bold,
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
                                );
                              });
                        }),
                  ),

                  //
                  //page2

                  Container(
                    height: 1000,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("images")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return SizedBox();
                          }
                          return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 220,
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  top: 12,
                                                  right: 8,
                                                  bottom: 2),
                                              child: Container(
                                                height: 100,
                                                width: 190,
                                                child: Image.network(
                                                  snapshot.data!.docs[index]
                                                      ['image'],
                                                  fit: BoxFit.cover,
                                                ),
                                              )),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, right: 8),
                                            child: Text(
                                              snapshot.data!.docs[index]
                                                  ['name'],
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
                                );
                              });
                        }),
                  ),

                  //page3

                  Container(
                    height: 1000,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('videos')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          return ListView(
                            children: snapshot.data!.docs.map((document) {
                              var url = document['url'];

                              YoutubePlayerController _controller =
                                  YoutubePlayerController(
                                initialVideoId:
                                    YoutubePlayer.convertUrlToId(url)
                                        .toString(),
                                flags: YoutubePlayerFlags(
                                  autoPlay: false,
                                  mute: false,
                                  disableDragSeek: false,
                                  loop: false,
                                  isLive: false,
                                  forceHD: false,
                                ),
                              );

                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black)),
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    child: Column(
                                      children: <Widget>[
                                        YoutubePlayer(
                                          controller: _controller,
                                          liveUIColor: Colors.amber,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 0,
                                            bottom: 5,
                                          ),
                                          child: Text(document['name'],
                                              maxLines: 2,
                                              textAlign: TextAlign.justify,
                                              style: GoogleFonts.dmSans(
                                                  fontStyle: FontStyle.normal)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
