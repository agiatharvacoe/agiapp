import 'package:agi_app/model/noticeModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/colors.dart';
import '../components/pdfviewer.dart';

class NoticeScreen extends StatefulWidget {
  final college;
  final department;
  const NoticeScreen(
      {super.key, required this.college, required this.department});

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  List<NoticeModel> notice = [];
  bool isLoaded = false;
  int len = 0;
  @override
  void initState() {
    // TODO: implement initState
    fetchnotice();
    super.initState();
  }

  fetchnotice() async {
    if (widget.department == "null") {
      var notice = await FirebaseFirestore.instance
          .collection('details')
          .doc(widget.college)
          .collection('notices')
          .get();
      mapnotice(notice);
      print(notice);
    } else {
      var notice = await FirebaseFirestore.instance
          .collection('details')
          .doc(widget.college)
          .collection('departments')
          .doc(widget.department)
          .collection('notices')
          .get();
      mapnotice(notice);
      print(notice);
    }
  }

  mapnotice(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map(
          (item) => NoticeModel(
            title: item["title"],
            notice: item["notice"],
          ),
        )
        .toList();
    print("Lenghth faculty");
    print(_list.length);
    setState(() {
      isLoaded = true;
      notice = _list;
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
          "Notices",
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
              itemCount: notice.length,
              // shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PDFViewerWidget(
                              title: notice[index].title,
                              url: notice[index].notice),
                        ),
                      );
                    },
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
                      notice[index].title,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 14,
                            color: black,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.bold),
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
