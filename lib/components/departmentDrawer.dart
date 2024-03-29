import 'package:agi_app/common/colors.dart';
import 'package:agi_app/components/pdfviewer.dart';
import 'package:agi_app/screens/advisory_committee.dart';
import 'package:agi_app/screens/atharva_payment.dart';
import 'package:agi_app/screens/faculty.dart';
import 'package:agi_app/screens/notice_board.dart';
import 'package:agi_app/screens/online_admission.dart';
import 'package:agi_app/screens/student_results.dart';
import 'package:agi_app/screens/virtual_classroom.dart';
import 'package:agi_app/screens/vision_mission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'Pages/virtualClassrooms.dart';
// import 'Pages/noticeBoard.dart';
// import 'Pages/onlineAddmission.dart';
// import 'Pages/atharvaPayment.dart';
// import 'Pages/studentResult.dart';

class DepartmentDrawerWidget extends StatelessWidget {
  final department;
  final college;
  const DepartmentDrawerWidget(
      {Key? key, required String this.department, required this.college})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: black,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                  icon: FaIcon(
                    FontAwesomeIcons.xmark,
                    color: white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          ),
          BuildMenuItem(
              title: "Faculty",
              onClicked: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      FacultyScreen(dept: department, college: college),
                ));
              }),
          BuildMenuItem(
              title: "Advisory Committee",
              onClicked: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AdvisoryCommitteeScreen(
                      dept: department, college: college),
                ));
              }),
          BuildMenuItem(
              title: "Vision & Mission",
              onClicked: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      VisionMissionScreen(dept: department, college: college),
                ));
              }),
        ],
      ),
    );
  }

  Widget BuildMenuItem({
    required String title,
    VoidCallback? onClicked,
  }) {
    final bg = Color.fromRGBO(255, 230, 226, 1);
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        margin: EdgeInsets.all(15),
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: white,
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(fontSize: 15, color: black),
          ),
        ),
        // child: ListTile(
        //   tileColor: white,
        //   titleAlignment: ListTileTitleAlignment.center,
        //   // leading: ClipRRect(
        //   //   borderRadius: BorderRadius.circular(9),
        //   //   child: Container(
        //   //     height: 58,
        //   //     width: 58,
        //   //     color: bg,
        //   //     child: Image.asset(scale: 3, path),
        //   //   ),
        //   // ),
        //   // contentPadding: const EdgeInsets.all(25),
        //   title: Text(
        //     title,
        //     style: GoogleFonts.poppins(
        //       textStyle: TextStyle(fontSize: 15, color: black),
        //     ),
        //   ),
        //   onTap: onClicked,
        // ),
      ),
    );
  }

  selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      // case 0:
      //   print("CLIECKED");
      //   PDF(
      //     swipeHorizontal: true,
      //   ).cachedFromUrl('http://africau.edu/images/default/sample.pdf');
      //   break;
      case 1:
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => PDFViewerWidget(title: "Fees", url: feesUrl),
        //   ),
        // );
        break;
      case 2:
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) =>
        //         PDFViewerWidget(title: "Online Admission", url: admissionUrl),
        //   ),
        // );
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AtharvaPayment(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const StudentResults(),
        ));
        break;
    }
  }
}
