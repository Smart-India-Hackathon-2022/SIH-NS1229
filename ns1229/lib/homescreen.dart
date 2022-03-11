import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String typeselected = "News";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
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
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Container(
                  child: Center(
                    child: Text(
                      'News',
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                            color: typeselected == "News"
                                ? Colors.white
                                : Colors.red[900],
                            fontSize: 17,
                            letterSpacing: .5),
                      ),
                    ),
                  ),
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: typeselected == "New"
                          ? Colors.red[900]
                          : Colors.white,
                      border: Border.all(color: Colors.red.shade900),
                      borderRadius: BorderRadius.circular(70)),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 40,
                  width: 100,
                  child: Center(
                    child: Text(
                      'Videos',
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            letterSpacing: .5),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.red[900],
                      borderRadius: BorderRadius.circular(70)),
                )
              ],
            ),
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
