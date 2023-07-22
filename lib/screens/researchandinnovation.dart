import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/colors.dart';
import '../model/campusLife.dart';

class RNDScreen extends StatefulWidget {
  final college;
  const RNDScreen({super.key, required this.college});

  @override
  State<RNDScreen> createState() => _RNDScreenState();
}

class _RNDScreenState extends State<RNDScreen> {
  List<CampusLifeModel> data = [];
  bool isLoaded = false;
  int len = 0;
  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  fetchData() async {
    var data = await FirebaseFirestore.instance
        .collection('details')
        .doc(widget.college)
        .collection('rnd')
        .get();
    mapData(data);
    print(data);
  }

  mapData(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map(
          (item) => CampusLifeModel(
            name: item["title"],
            image: item["image"],
            desc: item["desc"],
          ),
        )
        .toList();
    print("Lenghth faculty");
    print(_list.length);
    setState(() {
      isLoaded = true;
      data = _list;
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
          "Research and Innovation",
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
              itemCount: data.length,
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
                    leading: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(height: 50, data[index].image)),
                    title: Text(
                      data[index].name,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 14,
                            color: black,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Text(
                      data[index].desc,
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
