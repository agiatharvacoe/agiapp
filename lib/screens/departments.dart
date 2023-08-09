import 'package:agi_app/components/departmentDrawer.dart';
import 'package:agi_app/components/notices_widget.dart';
import 'package:agi_app/components/year_button.dart';
import 'package:agi_app/model/yearModel.dart';
import 'package:agi_app/screens/notice_board.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../common/colors.dart';
import '../components/drawer.dart';
import '../components/hod_card.dart';

class DepartmentScreen extends StatefulWidget {
  final department;
  final hodImageUrl;
  final hodName;
  final title;
  final college;
  final desc;
  final hodDesc;
  final banner;
  const DepartmentScreen({
    super.key,
    required this.department,
    required this.hodImageUrl,
    required this.hodName,
    required this.title,
    required this.college,
    required this.desc,
    required this.hodDesc,
    required this.banner,
  });

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  List<YearModel> years = [];
  bool isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    fetchInstitutes();
    super.initState();
  }

  fetchInstitutes() async {
    print(widget.department);
    var years = await FirebaseFirestore.instance
        .collection(widget.college + 'Departments')
        .doc(widget.department)
        .collection("years")
        .get();
    mapColleges(years);
    print(years);
  }

  mapColleges(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map(
          (item) => YearModel(
            year: item["year"],
            department: item["department"],
          ),
        )
        .toList();
    // print(_list.length);
    setState(() {
      isLoaded = true;
      years = _list;
    });

    print(_list.length);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondBackgroundColor,
      drawerEnableOpenDragGesture: false,
      endDrawer: DepartmentDrawerWidget(
          department: widget.department, college: widget.college),
      appBar: AppBar(
        leading: IconButton(
          icon: ImageIcon(AssetImage('assets/images/white_arr.png'),
              color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
            ),
          ),
        ],
        // toolbarHeight: 60,
        iconTheme: IconThemeData(color: black),
        elevation: 0,
        centerTitle: true,
        // title: Text(
        //   widget.department,
        //   style: GoogleFonts.poppins(
        //     textStyle: TextStyle(
        //         fontSize: 16,
        //         color: white,
        //         letterSpacing: 0.5,
        //         fontWeight: FontWeight.normal),
        //   ),
        // ),
        backgroundColor: secondBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                // height: 512,
                // margin: const EdgeInsets.only(top: 50),
                child: CachedNetworkImage(
                  imageUrl: widget.banner,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  widget.title,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: orange),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  widget.desc,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 15, color: departmentDescColor),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NoticeScreen(
                      department: widget.department,
                      college: widget.college,
                    ),
                  ));
                },
                child: NoticesWidget(
                  notice: "Department's",
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Select Your Year',
                        style: GoogleFonts.poppins(
                            textStyle:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                child: Container(
                  // margin: EdgeInsets.only(
                  //   left: 5,
                  // ),
                  // height: 150,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: years.length,
                    shrinkWrap: true,
                    // physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return YearButton(
                          year: years[index].year,
                          department: years[index].department,
                          college: widget.college
                          // onClicked: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => DepartmentScreen(
                          //           department: departments[index].name,
                          //           hodImageUrl: departments[index].hodImageUrl,
                          //           hodName: departments[index].hodName),
                          //     ),
                          //   );
                          // }
                          // selectedItem(context, clgList[index].id),
                          );
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "HOD Details",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              HodCard(
                imagePath: widget.hodImageUrl,
                description: widget.hodDesc,
                title: widget.hodName,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//   Widget blockTitle(String title) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Padding(
//         padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
//         child: Text(
//           title,
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//       ),
//     );
//   }

//   Widget yearSelect(String year) {
//     return Container(
//       margin: EdgeInsets.only(right: 20),
//       width: 60,
//       height: 60,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//             color: Colors.red,
//             width: 1,
//           )),
//       child: ElevatedButton(
//         style: ButtonStyle(
//           elevation: MaterialStateProperty.all(0),
//           backgroundColor: MaterialStateProperty.all(Colors.transparent),
//         ),
//         onPressed: () {},
//         child: Text(
//           year,
//           style: const TextStyle(
//             color: orange,
//             fontSize: 15,
//           ),
//         ),
//       ),
//     );
//   }
// }
