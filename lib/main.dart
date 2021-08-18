import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.white70),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> fontFamilyes = [
    GoogleFonts.montserrat().fontFamily.toString(),
    GoogleFonts.indieFlower().fontFamily.toString(),
    GoogleFonts.pacifico().fontFamily.toString(),
    GoogleFonts.poppins().fontFamily.toString(),
    GoogleFonts.andada().fontFamily.toString(),
    // GoogleFonts.zeyada().fontFamily.toString(),
    // GoogleFonts.giveYouGlory().fontFamily.toString(),
    GoogleFonts.damion().fontFamily.toString(),
    GoogleFonts.comicNeue().fontFamily.toString(),
    GoogleFonts.calligraffitti().fontFamily.toString(),
    GoogleFonts.montez().fontFamily.toString(),
    // GoogleFonts.craftyGirls().fontFamily.toString(),
  ];
  int count = 0;
  String fontFam = GoogleFonts.poppins().fontFamily.toString();
  int random = Random().nextInt(360);
  Color colors = HSLColor.fromAHSL(1, 220, 0.40, 0.40).toColor();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: colors));
    return Scaffold(
      backgroundColor: colors,
      body: Container(
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value) {},
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.normal,
                      fontFamily: fontFamilyes[count],
                      shadows: [
                        Shadow(
                          offset: Offset(0.5, 0.5),
                          blurRadius: 1.0,
                          color: Colors.black38,
                        ),
                        // Shadow(
                        //   offset: Offset(-1.0, -1.0),
                        //   blurRadius: 1.0,
                        //   color: Colors.black12,
                        // )
                      ]),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type a status",
                      hintStyle: TextStyle(color: Colors.white.withAlpha(50))),
                  cursorColor: Colors.white,
                  showCursor: true,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.font_download),
                      onPressed: () {
                        setState(() {
                          if (count == fontFamilyes.length - 1) {
                            count = 0;
                          }
                          count++;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.color_lens),
                      onPressed: () {
                        setState(() {
                          colors = HSLColor.fromAHSL(
                                  1, Random().nextDouble() * 360, 0.40, 0.50)
                              .toColor();
                        });
                      },
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.download),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
