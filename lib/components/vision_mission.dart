import 'package:agi_app/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VisionMissionWidget extends StatefulWidget {
  final vision;
  final mission;
  const VisionMissionWidget(
      {super.key, required String this.mission, required String this.vision});

  @override
  State<VisionMissionWidget> createState() => _VisionMissionWidgetState();
}

class _VisionMissionWidgetState extends State<VisionMissionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/vision.png",
                // height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Our Mission",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 15,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            color: orange),
                      ),
                    ),
                    SizedBox(
                      width: 220,
                      child: Text(
                        widget.mission,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 30,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 13,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              color: white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/mission.png",
                // height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Our Vision",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 15,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            color: orange),
                      ),
                    ),
                    SizedBox(
                      width: 220,
                      child: Text(
                        widget.vision,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 30,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 13,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              color: white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
