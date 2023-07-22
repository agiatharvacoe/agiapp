import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/colors.dart';
import '../model/advisoryCommitteeModel.dart';

class AdvisoryCommitteeScreen extends StatefulWidget {
  final dept;
  const AdvisoryCommitteeScreen({super.key, required this.dept});

  @override
  State<AdvisoryCommitteeScreen> createState() =>
      _AdvisoryCommitteeScreenState();
}

class _AdvisoryCommitteeScreenState extends State<AdvisoryCommitteeScreen> {
  List<AdCommitteeModel> committee = [];
  bool isLoaded = false;
  int len = 0;
  @override
  void initState() {
    // TODO: implement initState
    fetchAdCommittee();
    super.initState();
  }

  fetchAdCommittee() async {
    var committee = await FirebaseFirestore.instance
        .collection('details')
        .doc('ace')
        .collection('departments')
        .doc(widget.dept)
        .collection('board')
        .get();
    mapAdCommittee(committee);
    print(committee);
  }

  mapAdCommittee(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map(
          (item) => AdCommitteeModel(
            name: item["name"],
            designation: item["designation"],
            stakeholders: item["stakeholders"],
          ),
        )
        .toList();
    print("Lenghth faculty");
    print(_list.length);
    setState(() {
      isLoaded = true;
      committee = _list;
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
          "Advisory Committee",
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
              itemCount: committee.length,
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
                      committee[index].name +
                          '\n(' +
                          committee[index].stakeholders +
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
                      committee[index].designation,
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
