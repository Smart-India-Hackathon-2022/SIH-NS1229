import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
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
              height: 100,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(100)),
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
                    height: 50,
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
                  height: 50,
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
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 200,
                        color: Colors.black12,
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
