import 'package:agi_app/components/departmentCard.dart';
import 'package:agi_app/components/notices.dart';
import 'package:agi_app/components/banner.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       builder: (context, child) {
//         return ScrollConfiguration(
//             behavior: _OverScrollBehaviour(), child: child!);
//       },
//       debugShowCheckedModeBanner: false,
//       theme: new ThemeData(scaffoldBackgroundColor: const Color(0xff1B1E23)),
//       home: Scrollbar(
//         child: const DeptPage(),
//       ),
//     );
//   }
// }

// class _OverScrollBehaviour extends ScrollBehavior {
//   @override
//   Widget buildViewportChrome(
//       BuildContext context, Widget child, AxisDirection axisDirection) {
//     return GlowingOverscrollIndicator(
//       axisDirection: axisDirection,
//       color: Colors.grey,
//       child: child,
//     );
//   }
// }

// ignore: must_be_immutable
class InstitutesWidget extends StatefulWidget {
  String name;
  String urlImage;
  String desc;

  InstitutesWidget({
    super.key,
    required String this.name,
    required String this.desc,
    // required String img,
    required String this.urlImage,
  });

  @override
  State<InstitutesWidget> createState() => _InstitutesWidgetState();
}

class _InstitutesWidgetState extends State<InstitutesWidget> {
  @override
  Widget build(BuildContext context) {
    final screen_height = MediaQuery.of(context).size.height;
    final screen_width = MediaQuery.of(context).size.width;
    print(screen_height);
    print(screen_width);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xff1B1E23),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: IconButton(
                        iconSize: 26,
                        icon: ImageIcon(
                            AssetImage('assets/images/white_arr.png'),
                            color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          widget.name,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: IconButton(
                        icon: ImageIcon(
                            AssetImage('assets/images/white_menu.png'),
                            color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff1B1E23).withOpacity(0),
                            Color(0xff1B1E23),
                          ],
                          stops: [0, 0.9],
                        )),
                        child: Container(
                            child: Image.network(
                          widget.urlImage,
                          width: screen_width,
                          height: 417,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              widget.name,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 20,
                      //   width: screen_width,
                      //   child: const DecoratedBox(
                      //     decoration:
                      //         const BoxDecoration(color: Color(0xff1B1E23)),
                      //   ),
                      // )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Color(0xff1B1E23),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      widget.desc,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 12,
                              color: Color(0xffB5B5B5),
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Notices(),
                ),

                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: DeptBanner(),
                ),

                SizedBox(
                  height: 20,
                  width: screen_width,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(color: Color(0xff1B1E23)),
                  ),
                ),
                Container(
                  color: Color(0xff1B1E23),
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Departments',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
                DepartmentCard(),
                Container(
                  color: Color(0xff1B1E23),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SizedBox(
                          width: (screen_width - 48) / 2,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FoundersMessageRoute()),
                              );
                            },
                            child: Text(
                              "Founder's message",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.black, fontSize: 10)),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffFDFDFD),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      SizedBox(
                        width: (screen_width - 48) / 2,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PrincipalsDeskRoute()),
                              );
                            },
                            child: Text(
                              "Principal's Desk",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.black, fontSize: 10)),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffFDFDFD),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: screen_width,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(color: Color(0xff1B1E23)),
                  ),
                ),
                Container(
                  color: Color(0xff1B1E23),
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Top Recruiters',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(fontSize: 14, color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: screen_width,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(color: Color(0xff1B1E23)),
                  ),
                ),
                Container(
                  height: 125,
                  color: Color(0xffD9D9D9),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 34, top: 17),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/amazon_logo.png',
                            width: 109,
                            height: 32,
                          ),
                          SizedBox(
                            width: 32,
                          ),
                          Image.asset(
                            'assets/images/capgemini_logo.png',
                            width: 135,
                            height: 32,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 34, top: 10),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/accenture_logo.png',
                            width: 112,
                            height: 31,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Image.asset(
                            'assets/images/infosys_logo.png',
                            width: 75,
                            height: 30,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Image.asset(
                            'assets/images/wipro_logo.png',
                            width: 70,
                            height: 60,
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  height: 40,
                  width: screen_width,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(color: Color(0xff1B1E23)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FoundersMessageRoute extends StatelessWidget {
  const FoundersMessageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final screen_height = MediaQuery.of(context).size.height;
    final screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffE5E8ED),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(
              //   height: 40,
              // ),
              Container(
                color: Color(0xffE5E8ED),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: IconButton(
                        iconSize: 26,
                        icon: ImageIcon(
                          AssetImage('assets/images/black_arr.png'),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    Center(
                      child: Text(
                        'Atharva Group of Engineering',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontSize: 14,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 17,
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: 350,
                  height: 286,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 11, top: 8, bottom: 9),
                    child: Image.asset(
                      'assets/images/sunil_rane.png',
                      width: 329,
                      height: 269,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        'Shri. Sunil Rane',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: Color(0xff09101D),
                          fontSize: 16,
                        )),
                      ),
                      Text(
                        "Executive - President of Atharva Group of Institutes & Founder Secretary - AET",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: Color(0xff383838),
                          fontSize: 14,
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 32),
                    child: Column(
                      children: [
                        Text(
                          "Dear Students and Parents, \n\nAtharva is one of the fastest growing, educational brand in India which is a blend of continuous innovation and global benchmarking. The objective of the Atharva Group of Institutes is to create ‘industry ready’ youth who can be gainfully employed upon completion of their courses. \n\nOur outstanding progress by creating world class infrastructure consisting of a sprawling educational campus with green cover which is a landmark. \n\nOur focus is on Research, Technology & Innovation. \n\nI am overwhelmed by the progress made by the institution at various levels – academic, cultural and sports. The noteworthy experience of mine is the standard of discipline and the uniqueness that the students and parents have established in the institution. \n\nDedicated teachers, sophisticated equipments, sincerity and punctuality proven our merit and I am sure that in years to come the institution will surpass many established existing institutions. \n\nIn addition we have several diversifications, the primary of which is the IT park which will be a challenge to accomplish and achieve. I urge every Atharvite to make efforts to take the brand to newer heights. Let us make our ATHARVA the best in professional education in the world. \n\nI wish the students, staff and all the employees of the institution the best of luck in making the institution great.",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            color: Color(0xff171717),
                            fontSize: 12,
                          )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/stamp.png',
                              width: (screen_width / 4),
                              // height: (screen_height - 134) / 2,
                              height: screen_width / 4,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: 77.4 / 2),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 0, bottom: 18),
                              child: Image.asset(
                                'assets/images/sign.png',
                                width: (screen_width / 4),
                                height: (screen_height / 4),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PrincipalsDeskRoute extends StatelessWidget {
  const PrincipalsDeskRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final screen_height = MediaQuery.of(context).size.height;
    final screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffE5E8ED),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color(0xffE5E8ED),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: IconButton(
                        iconSize: 26,
                        icon: ImageIcon(
                          AssetImage('assets/images/back_arrow.png'),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Center(
                      child: Text(
                        'Atharva Group of Engineering',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: Color(0xff1B1E23),
                          fontSize: 14,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 34,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Container(
                        width: 171,
                        child: Column(
                          children: [
                            Text(
                              "Shri. Sunil Rane",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                color: Color(0xff09101D),
                                fontSize: 18,
                              )),
                            ),
                            Text(
                              "\nExecutive - President of Atharva Group of Institutes & Founder Secretary - AET",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                color: Color(0xff383838),
                                fontSize: 12,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Container(
                        width: 173,
                        height: 140,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 6, right: 5, top: 4, bottom: 4),
                          child: Image.asset(
                            'assets/images/sunil_rane.png',
                            width: 162,
                            height: 132,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(29)),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 17.05, right: 16.15, top: 32),
                  child: Column(
                    children: [
                      Text(
                        "Dear Students and Parents, \n\nAtharva is one of the fastest growing, educational brand in India which is a blend of continuous innovation and global benchmarking. The objective of the Atharva Group of Institutes is to create ‘industry ready’ youth who can be gainfully employed upon completion of their courses. \n\nOur outstanding progress by creating world class infrastructure consisting of a sprawling educational campus with green cover which is a landmark. \n\nOur focus is on Research, Technology & Innovation. \n\nI am overwhelmed by the progress made by the institution at various levels – academic, cultural and sports. The noteworthy experience of mine is the standard of discipline and the uniqueness that the students and parents have established in the institution. \n\nDedicated teachers, sophisticated equipments, sincerity and punctuality proven our merit and I am sure that in years to come the institution will surpass many established existing institutions. \n\nIn addition we have several diversifications, the primary of which is the IT park which will be a challenge to accomplish and achieve. I urge every Atharvite to make efforts to take the brand to newer heights. Let us make our ATHARVA the best in professional education in the world. \n\nI wish the students, staff and all the employees of the institution the best of luck in making the institution great.",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: Color(0xff171717),
                          fontSize: 12,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 19),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/stamp.png',
                              width: (screen_width / 4),
                              // height: (screen_height - 134) / 2,
                              height: screen_width / 4,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: 77.4 / 2),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 0, bottom: 18),
                              child: Image.asset(
                                'assets/images/sign.png',
                                width: (screen_width / 4),
                                height: (screen_height / 4),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
