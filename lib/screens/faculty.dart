import 'package:agi_app/model/facultyModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/colors.dart';

class FacultyScreen extends StatefulWidget {
  final dept;
  const FacultyScreen({super.key, required this.dept});

  @override
  State<FacultyScreen> createState() => _FacultyScreenState();
}

class _FacultyScreenState extends State<FacultyScreen> {
  List<FacultyModel> faculties = [];
  bool isLoaded = false;
  int len = 0;
  @override
  void initState() {
    // TODO: implement initState
    fetchFaculties();
    super.initState();
  }

  fetchFaculties() async {
    var faculties = await FirebaseFirestore.instance
        .collection('details')
        .doc('ace')
        .collection('departments')
        .doc(widget.dept)
        .collection('faculties')
        .get();
    mapFaculties(faculties);
    print(faculties);
  }

  mapFaculties(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map(
          (item) => FacultyModel(
            name: item["name"] ?? "a",
            image: item["image"] ?? "a",
            desc: item["desc"] ?? "a",
          ),
        )
        .toList();
    print("Lenghth faculty");
    // print(_list[1]);
    setState(() {
      isLoaded = true;
      faculties = _list;
      len = _list.length;
    });
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
          "Faculties",
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
          height: MediaQuery.of(context).size.height + (len * 70),
          width: double.infinity,
          child: ListView.builder(
            itemCount: faculties.length,
            // shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(5),
                child: ListTile(
                  tileColor: backgroundColor,
                  contentPadding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  leading: SizedBox(
                    height: 60,
                    width: 60,
                    child: CachedNetworkImage(imageUrl: faculties[index].image),
                  ),
                  title: Text(
                    faculties[index].name,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 14,
                          color: black,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Text(
                    faculties[index].desc,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 12,
                          color: black,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
