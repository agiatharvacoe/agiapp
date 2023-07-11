import 'dart:isolate';

import 'package:agi_app/common/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/hod_card.dart';
import '../components/pdfviewer.dart';

class ShowYearDetailsModel {
  final String departmentName;
  final String desc;
  final String hodDetails;
  final String hodImageUrl;
  final String hodName;
  final String syllabus;
  final String result;
  final String timetable;
  final String topper;

  const ShowYearDetailsModel({
    required this.departmentName,
    required this.desc,
    required this.hodDetails,
    required this.hodImageUrl,
    required this.hodName,
    required this.syllabus,
    required this.result,
    required this.timetable,
    required this.topper,
  });
}

class YearScreen extends StatefulWidget {
  final college;
  final year;
  final department;
  const YearScreen(
      {super.key,
      required this.college,
      required this.year,
      required this.department});

  @override
  State<YearScreen> createState() => _YearScreenState();
}

class _YearScreenState extends State<YearScreen> {
  Map<String, dynamic>? details;
  bool isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    fetchInstitutes();
    super.initState();
  }

  fetchInstitutes() async {
    print(widget.year);
    if (widget.year == "FE") {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('details')
              .doc('ace')
              .collection('departments')
              .doc('has')
              .get();

      if (snapshot.exists) {
        final Map<String, dynamic>? data = snapshot.data();
        setState(() {
          details = data;
          isLoaded = true;
        });
        print(data);
        // Do something with the document data
      } else {
        // Document does not exist
      }
    } else {
      var departments =
          await FirebaseFirestore.instance.collection('aceDepartments').get();
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('details')
              .doc(widget.college)
              .collection('departments')
              .doc(widget.department)
              .collection("years")
              .doc(widget.year)
              .get();

      if (snapshot.exists) {
        final Map<String, dynamic>? data = snapshot.data();
        setState(() {
          details = data;
          isLoaded = true;
        });
        print(data);
        // Do something with the document data
      } else {
        // Document does not exist
      }
    }
    print(details);
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
            widget.year,
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
        backgroundColor: drawerColor,
        body: isLoaded
            ? Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          details!["department"],
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: orange),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          details!["desc"],
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: white),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 24.0),
                      //   child: Container(
                      //     height: 130,
                      //     decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         borderRadius: BorderRadius.circular(24)),
                      //     child: Row(
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.all(14.0),
                      //           child: Column(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               Container(
                      //                 decoration: BoxDecoration(
                      //                     color: Colors.amber,
                      //                     borderRadius:
                      //                         BorderRadius.circular(24),
                      //                     border: Border.all(
                      //                         color: Colors.black, width: 2.0)),
                      //                 height: 100,
                      //                 width: 100,
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.only(
                      //               left: 20.0, top: 20.0),
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: const [
                      //               Text(
                      //                 "Hod Desk",
                      //                 style: TextStyle(
                      //                   fontWeight: FontWeight.bold,
                      //                   fontSize: 16,
                      //                 ),
                      //               ),
                      //               Text("Assistant Professor"),
                      //               Text(
                      //                 "Ph.D (Pursuing), ME (EXTC), BE (EXTC),",
                      //                 style: TextStyle(fontSize: 10),
                      //               ),
                      //               Text(
                      //                 "15 years",
                      //                 style: TextStyle(
                      //                     fontWeight: FontWeight.bold),
                      //               )
                      //             ],
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      HodCard(
                        title: details!["hodName"],
                        description: details!["hodDesc"],
                        imagePath: details!["hodImage"],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      GridView(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 12,
                                  crossAxisSpacing: 12),
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => PDFViewerWidget(
                                        title: "Syllabus",
                                        url: details!["syllabus"]),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Syllabus",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => PDFViewerWidget(
                                        title: "Result",
                                        url: details!["result"]),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Result",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => PDFViewerWidget(
                                        title: "Time-Table",
                                        url: details!["timetable"]),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Timetable",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => PDFViewerWidget(
                                        title: "Topper",
                                        url: details!["topper"]),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Topper",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              )
            : SizedBox());
  }
}
