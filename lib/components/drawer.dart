import 'package:agi_app/common/colors.dart';
import 'package:agi_app/screens/atharva_payment.dart';
import 'package:agi_app/screens/notice_board.dart';
import 'package:agi_app/screens/online_admission.dart';
import 'package:agi_app/screens/student_results.dart';
import 'package:agi_app/screens/virtual_classroom.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'Pages/virtualClassrooms.dart';
// import 'Pages/noticeBoard.dart';
// import 'Pages/onlineAddmission.dart';
// import 'Pages/atharvaPayment.dart';
// import 'Pages/studentResult.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: black,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
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
              title: "Notice Board",
              onClicked: () => selectedItem(context, 1),
              path: "assets/images/noticeBoard.png"),
          BuildMenuItem(
              title: "Online Admission",
              onClicked: () => selectedItem(context, 2),
              path: "assets/images/admission.png"),
          BuildMenuItem(
              title: "Atharva Payment",
              onClicked: () => selectedItem(context, 3),
              path: "assets/images/payment.png"),
          BuildMenuItem(
              title: "Student Result",
              onClicked: () => selectedItem(context, 4),
              path: "assets/images/result.png"),
          BuildMenuItem(
              title: "Settings",
              onClicked: () => selectedItem(context, 4),
              path: "assets/images/result.png"),
        ],
      ),
    );
  }

  Widget BuildMenuItem({
    required String title,
    required String path,
    VoidCallback? onClicked,
  }) {
    final bg = Color.fromRGBO(255, 230, 226, 1);
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: Container(
          height: 58,
          width: 58,
          color: bg,
          child: Image.asset(scale: 3, path),
        ),
      ),
      contentPadding: const EdgeInsets.all(25),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(fontSize: 15, color: white),
        ),
      ),
      onTap: onClicked,
    );
  }

  selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const VirtualClassroom(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const NoticeBoard(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const OnlineAdmission(),
        ));
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
