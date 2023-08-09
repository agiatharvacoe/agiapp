import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/colors.dart';
import '../model/commiteeModel.dart';

class CommitteeScreen extends StatefulWidget {
  final college;
  const CommitteeScreen({super.key, required this.college});

  @override
  State<CommitteeScreen> createState() => _CommitteeScreenState();
}

class _CommitteeScreenState extends State<CommitteeScreen> {
  List<CommitteeModel> committee = [];
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
        .doc(widget.college)
        .collection('committees')
        .get();
    mapAdCommittee(committee);
    print(committee);
  }

  mapAdCommittee(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map(
          (item) => CommitteeModel(
              name: item["name"],
              image: item["image"],
              desc: item["desc"],
              studentCoordinator: item["studentCoordinator"]),
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
          "Committees",
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
          height: MediaQuery.of(context).size.height + (len * 250),
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
                    leading: SizedBox(
                        height: 100,
                        width: 100,
                        child:
                            Image.network(height: 50, committee[index].image)),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          committee[index].name,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 14,
                                color: black,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          committee[index].studentCoordinator,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 12,
                                color: black,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      committee[index].desc,
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
