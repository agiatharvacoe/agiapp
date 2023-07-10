import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee_text/marquee_text.dart';

import '../common/colors.dart';

class HomeNoticeWidget extends StatefulWidget {
  const HomeNoticeWidget({super.key});

  @override
  State<HomeNoticeWidget> createState() => _HomeNoticeWidgetState();
}

class _HomeNoticeWidgetState extends State<HomeNoticeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: white,
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Important Notice",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
              MarqueeText(
                text: TextSpan(
                  text:
                      'This project is a starting point for a Dart package, a library module containing code that can be shared easily across multiple Flutter or Dart projects. ',
                ),
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 11),
                ),
                speed: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
