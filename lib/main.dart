// import 'package:agi_app/eng_dept.dart';
import 'package:agi_app/components/college_tile.dart';
import 'package:agi_app/components/drawer.dart';
import 'package:agi_app/components/foundersDesk.dart';
import 'package:agi_app/firebase_options.dart';
import 'package:agi_app/model/college.dart';
import 'package:agi_app/screens/institutes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common/colors.dart';
import 'common/strings.dart';
import 'components/card.dart';
import 'components/carouselSlider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppBarText,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // textTheme: GoogleFonts.poppinsTextTheme(
        //   Theme.of(context).textTheme,
        // ),
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondBackgroundColor,
      endDrawer: Navbar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Builder(
              builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: Image.asset(
                        "assets/images/menu.png",
                        width: 30,
                      ),
                    ),
                  )),
        ],
        // toolbarHeight: 60,
        iconTheme: IconThemeData(color: black),
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppBarText,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 16,
                color: white,
                letterSpacing: 0.5,
                fontWeight: FontWeight.normal),
          ),
          // style: TextStyle(
          //   color: black,
          //   letterSpacing: 0.5,
          //   fontWeight: FontWeight.normal,
          //   // fontFamily: 'Poppins',
          //   fontSize: 16,
          // ),
        ),
        backgroundColor: secondBackgroundColor,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.menu_rounded,
        //     color: Colors.black,
        //   ),
        //   onPressed: () {
        //     scaffoldKey.currentState?.openDrawer();
        //   },
        // ),
      ),
      drawer: const Drawer(
        backgroundColor: drawerColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: secondBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const carouselSlider(),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      color: white,
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Important Notice",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(fontSize: 16),
                            ),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(fontSize: 11),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                child: Text(
                  "Colleges",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(fontSize: 20), color: white),
                  // style: TextStyle(
                  //     fontSize: 20, fontWeight: FontWeight.w800, color: white),
                ),
              ),
              // Stack(
              //   children: [
              //     Container(
              //       margin: EdgeInsets.only(top: 5, left: 15, bottom: 10),
              //       height: 150,
              //       width: double.infinity,
              //       child: ListView.builder(
              //         itemCount: clgList.length,
              //         shrinkWrap: true,
              //         // physics: ClampingScrollPhysics(),
              //         scrollDirection: Axis.horizontal,
              //         itemBuilder: (context, index) {
              //           return Colleges(
              //               path: clgList[index].path,
              //               id: clgList[index].id,
              //               onClicked: () {
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                     builder: (context) => DeptPage(
              //                       name: clgList[index].name,
              //                       desc: clgList[index].desc,
              //                       img: clgList[index].path,
              //                     ),
              //                   ),
              //                 );
              //               }
              //               // selectedItem(context, clgList[index].id),
              //               );
              //         },
              //       ),
              //     ),
              //   ],
              // ),
              CollegeCard(),
              FoundersDesk(),
            ],
          ),
        ),
      ),
    );
  }
}
