import 'package:agi_app/components/detailsCard.dart';
import 'package:agi_app/model/aboutAppModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/colors.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({super.key});

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  List<AppDataModel> faculties = [];
  List<AppDataModel> devTeam = [];
  List<AppDataModel> jrDevTeam = [];
  bool isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  fetchData() async {
    final CollectionReference<Map<String, dynamic>> collectionReference =
        FirebaseFirestore.instance.collection('aboutapp');
    final String documentId = 'v1';
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await collectionReference.doc(documentId).get();
    if (snapshot.exists) {
      final Map<String, dynamic>? data = snapshot.data();
      var _faculties = await FirebaseFirestore.instance
          .collection('aboutapp')
          .doc(data!["symbol"])
          .collection('facultyCoordinators')
          .get();
      var _devTeam = await FirebaseFirestore.instance
          .collection('aboutapp')
          .doc(data!["symbol"])
          .collection('main')
          .get();
      var _jrDevTeam = await FirebaseFirestore.instance
          .collection('aboutapp')
          .doc(data!["symbol"])
          .collection('junior')
          .get();
      setState(() {
        faculties = mapData(_faculties);
        devTeam = mapData(_devTeam);
        jrDevTeam = mapData(_jrDevTeam);
        isLoaded = true;
      });
    }
  }

  mapData(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map(
          (item) => AppDataModel(
            name: item["name"],
            image: item["image"],
            role: item["role"],
          ),
        )
        .toList();
    print("Lenghth faculty");
    print(_list.length);
    return _list;
    // setState(() {
    //   isLoaded = true;
    //   faculties = _list;
    //   len = _list.length;
    // });
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
          "About App",
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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "App Version : 1.0",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 14,
                      color: white,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Text(
                "Rights: Atharva Groups Of Institutes",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 14,
                      color: white,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Text(
                "App Made in Flutter",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 14,
                      color: white,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.normal),
                ),
              ),
              isLoaded
                  ? Column(
                      children: [
                        Text(
                          "Faculty Co-ordinators",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: white,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(left: 15, right: 15),
                          height: 100.0 * faculties.length,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: faculties.length,
                            // shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Container(
                                  margin: const EdgeInsets.all(5),
                                  child: DetailsCard(
                                    name: faculties[index].name,
                                    image: faculties[index].image,
                                    role: faculties[index].role,
                                  ));
                            },
                          ),
                        ),
                        Text(
                          "Tech Team",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: white,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(left: 15, right: 15),
                          height: 100.0 * devTeam.length,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: devTeam.length,
                            // shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Container(
                                  margin: const EdgeInsets.all(5),
                                  child: DetailsCard(
                                    name: devTeam[index].name,
                                    image: devTeam[index].image,
                                    role: devTeam[index].role,
                                  ));
                            },
                          ),
                        ),
                        Text(
                          "Junior Team",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: white,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(left: 15, right: 15),
                          height: 100.0 * jrDevTeam.length,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: jrDevTeam.length,
                            // shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Container(
                                  margin: const EdgeInsets.all(5),
                                  child: DetailsCard(
                                    name: jrDevTeam[index].name,
                                    image: jrDevTeam[index].image,
                                    role: jrDevTeam[index].role,
                                  ));
                            },
                          ),
                        ),
                      ],
                    )
                  : Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}
