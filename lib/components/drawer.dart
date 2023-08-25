import 'package:agi_app/common/colors.dart';
import 'package:agi_app/screens/about_app.dart';
import 'package:agi_app/screens/atharva_payment.dart';
import 'package:agi_app/screens/contact_us.dart';
import 'package:agi_app/screens/notice_board.dart';
import 'package:agi_app/screens/online_admission.dart';
import 'package:agi_app/screens/student_results.dart';
import 'package:agi_app/screens/virtual_classroom.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'Pages/virtualClassrooms.dart';
// import 'Pages/noticeBoard.dart';
// import 'Pages/onlineAddmission.dart';
// import 'Pages/atharvaPayment.dart';
// import 'Pages/studentResult.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse(
        'https://eazypay.icicibank.com/eazypayLink?P1=vwdONifYnw2q0Wn1nJB9gA==1');

    return Drawer(
      backgroundColor: black,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 60, 10, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
          children: [
            Column(
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

                // BuildMenuItem(
                //     title: "Online Admission",
                //     onClicked: () => selectedItem(context, 2),
                //     path: "assets/images/admission.png"),
                BuildMenuItem(
                    title: "Atharva Payment",
                    onClicked: () {
                      launchUrl(
                        _url,
                        mode: LaunchMode.inAppWebView,
                      );
                    },
                    path: "assets/images/payment.png"),
                BuildMenuItem(
                    title: "Contact",
                    onClicked: () => selectedItem(context, 2),
                    path: "assets/images/contact.png"),
                // BuildMenuItem(
                //     title: "Student Result",
                //     onClicked: () => selectedItem(context, 4),
                //     path: "assets/images/result.png"),
                // BuildMenuItem(
                //     title: "Settings",
                //     // onClicked: () => selectedItem(context, 4),
                //     path: "assets/images/result.png"),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AboutApp(),
                ));
              },
              child: Column(
                children: [
                  // Container(
                  //   margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  //   height: 0.5,
                  //   width: double.infinity,
                  //   color: opacWhite,
                  // ),
                  Container(
                    child: ListTile(
                      leading: Text(
                        "About App ",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontSize: 15),
                            color: opacWhite),
                      ),
                      trailing: Text(
                        "v1.0",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontSize: 15),
                            color: opacWhite),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
          builder: (context) => const NoticeScreen(
            college: "agi",
            department: "null",
          ),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ContactUs(),
        ));
        break;
      // case 3:
      //   Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => const AtharvaPayment(),
      //   ));
      //   break;
    }
  }
}
