import 'package:agi_app/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoticesWidget extends StatefulWidget {
  final notice;
  const NoticesWidget({super.key, required this.notice});

  @override
  State<NoticesWidget> createState() => _NoticesWidgetState();
}

class _NoticesWidgetState extends State<NoticesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(width: 1, color: orange)),
          color: noticesBG,
          child: Container(
            alignment: Alignment.center,
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      // margin: EdgeInsets.symmetric(vertical: 5),
                      width: 40,
                      // height: 50,
                      color: backgroundColor,
                      child: Image.asset(
                        'assets/images/noticeBoard.png',
                        scale: 3,
                      )),
                ),
              ),
              // contentPadding: EdgeInsets.all(10),
              // trailing: Image.asset(
              //   'assets/images/cross.png',
              //   width: 20,
              //   color: Colors.grey,
              // ),
              title: Text(
                widget.notice + " Notices",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              subtitle: Text(
                "Tap for Notices",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 10,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
