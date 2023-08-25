// import 'package:agi_app/eng_dept.dart';
import 'package:agi_app/components/college_tile.dart';
import 'package:agi_app/components/drawer.dart';
import 'package:agi_app/components/foundersDesk.dart';
import 'package:agi_app/components/homeNotice.dart';
import 'package:agi_app/firebase_options.dart';
import 'package:agi_app/model/college.dart';
import 'package:agi_app/screens/institutes.dart';
import 'package:agi_app/screens/notice_board.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';

import 'common/colors.dart';
import 'common/strings.dart';
import 'components/card.dart';
import 'components/carouselSlider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  // final fcmToken = await FirebaseMessaging.instance.getToken();
  // print(fcmToken);
  runApp(const MyApp());
}

Future<void> backgroundHandler(RemoteMessage message) async {
  print("Received Message : ");
  print(message.notification!.title);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppBarText,
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/images/splashlogo.png'),
        backgroundColor: black,
        nextScreen: const Home(),
        splashIconSize: 250,
        duration: 400,
        centered: true,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
        animationDuration: const Duration(seconds: 2),
      ),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.onMessage.listen((event) {
      print("Received Message : ");
      print(event.notification!.title);
    });

    FirebaseMessaging.instance.getInitialMessage().then((event) {
      print("Received Message : ");
      print(event);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print("Received Message : ");
      print(event.notification!.title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondBackgroundColor,
      drawerEnableOpenDragGesture: false,
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
                        "assets/images/white_menu.png",
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
              // Container(
              //   margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              //   child: SizedBox(
              //     width: double.infinity,
              //     height: 80,
              //     child: Expanded(
              //       child: ClipRRect(
              //         borderRadius: BorderRadius.circular(12),
              //         child: Container(
              //           color: white,
              //           padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 "Important Notice",
              //                 style: GoogleFonts.poppins(
              //                   textStyle: TextStyle(fontSize: 16),
              //                 ),
              //               ),
              //               Text(
              //                 "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              //                 style: GoogleFonts.poppins(
              //                   textStyle: TextStyle(fontSize: 11),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // HomeNoticeWidget(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NoticeScreen(
                      college: "agi",
                      department: "null",
                    ),
                  ));
                },
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: SizedBox(
                      width: 60,
                      child: CircleAvatar(
                          backgroundColor: white,
                          child: Image.asset(
                            "assets/images/noticeBoard.png",
                            height: 37,
                          )),
                    ),
                    title: Text(
                      "Important Notice",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                    subtitle: Text(
                      "Tap to Open.",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 11),
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
