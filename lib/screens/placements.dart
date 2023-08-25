import 'package:agi_app/model/placementModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/colors.dart';

class PlacementScreen extends StatefulWidget {
  final college;
  const PlacementScreen({super.key, required this.college});

  @override
  State<PlacementScreen> createState() => _PlacementScreenState();
}

class _PlacementScreenState extends State<PlacementScreen> {
  List<PlacementModel> placement = [];
  bool isLoaded = false;
  int len = 0;
  @override
  void initState() {
    // TODO: implement initState
    fetchPlacement();
    super.initState();
  }

  fetchPlacement() async {
    var placement = await FirebaseFirestore.instance
        .collection('details')
        .doc(widget.college)
        .collection('placements')
        .get();
    mapPlacement(placement);
    print(placement);
  }

  mapPlacement(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map(
          (item) => PlacementModel(
            name: item["name"],
            image: item["image"],
            company: item["company"],
            branch: item["branch"],
          ),
        )
        .toList();
    print("Lenghth faculty");
    print(_list.length);
    setState(() {
      isLoaded = true;
      placement = _list;
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
          "Placements",
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
          height: MediaQuery.of(context).size.height + (len * 150),
          width: double.infinity,
          child: ListView.builder(
              itemCount: placement.length,
              // shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  child: ListTile(
                    tileColor: backgroundColor,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    // leading: SizedBox(
                    //   height: 60,
                    //   width: 60,
                    //   child:
                    //       CachedNetworkImage(imageUrl: faculties[index].image),
                    // ),
                    title: Text(
                      placement[index].name +
                          '\n(' +
                          placement[index].branch.toUpperCase() +
                          ")",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 14,
                            color: black,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Text(
                      placement[index].company,
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
              }),
        ),
      ),
    );
  }
}
