import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns1229/Admin/adminpanel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String typeselected = "News";
  List dept = [
    "Education",
    "Sports",
    "Technology",
    "Defence",
    "civil",
    "society",
    "Welfare"
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
          '24°',
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
            Container(
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
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
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
            SizedBox(
              height: 10,
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      newsselected = !newsselected;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      color: newsselected == true
                          ? Colors.red[900]
                          : Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      "News",
                      style: TextStyle(
                          color: newsselected ? Colors.white : Colors.black),
                    )),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    videoselected = !videoselected;
                  });
                },
                child: Container(
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                    color: videoselected == true
                        ? Colors.red[900]
                        : Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    "Videos",
                    style: TextStyle(
                        color: videoselected ? Colors.white : Colors.black),
                  )),
                ),
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Text(
              '     Latest',
              style: GoogleFonts.dmSans(
                textStyle: TextStyle(
                    color: Colors.black, fontSize: 17, letterSpacing: .5),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dept.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        child: Center(
                          child: Text(
                            dept[index].toString(),
                            style: GoogleFonts.dmSans(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  letterSpacing: .5),
                            ),
                          ),
                        ),
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: Container(
                height: 1000,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: dept.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 150,
                          child: Center(
                            child: Text(
                              dept[index].toString(),
                              style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    letterSpacing: .5),
                              ),
                            ),
                          ),
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
