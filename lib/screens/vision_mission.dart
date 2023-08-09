import 'package:agi_app/components/vision_mission.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/colors.dart';

class VisionMissionScreen extends StatefulWidget {
  final dept;
  final college;
  const VisionMissionScreen(
      {super.key, required this.dept, required this.college});

  @override
  State<VisionMissionScreen> createState() => _VisionMissionScreenState();
}

class _VisionMissionScreenState extends State<VisionMissionScreen> {
  Map<String, dynamic>? visionMission;
  bool isLoaded = false;
  fetchData() async {
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance
            .collection('details')
            .doc(widget.college)
            .collection('departments')
            .doc(widget.dept)
            .get();

    if (snapshot.exists) {
      final Map<String, dynamic>? data = snapshot.data();
      setState(() {
        visionMission = data;
        isLoaded = true;
      });
      print(data);
      // Do something with the document data
    } else {
      // Document does not exist
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: ImageIcon(AssetImage('assets/images/white_arr.png'),
                color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          // toolbarHeight: 60,
          iconTheme: IconThemeData(color: black),
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Vision and Mission",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 14,
                  color: white,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.normal),
            ),
          ),
          backgroundColor: secondBackgroundColor,
        ),
        body: SizedBox(
          child: isLoaded
              ? (((visionMission!["mission"] != "null") &&
                      (visionMission!["vision"] != "null"))
                  ? VisionMissionWidget(
                      mission: visionMission!["mission"],
                      vision: visionMission!["vision"])
                  : SizedBox())
              : SizedBox(),
        ));
  }
}
