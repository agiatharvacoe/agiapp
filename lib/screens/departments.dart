import 'package:agi_app/components/departmentDrawer.dart';
import 'package:agi_app/components/year_button.dart';
import 'package:agi_app/model/yearModel.dart';
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
  const DepartmentScreen({
    super.key,
    required this.department,
    required this.hodImageUrl,
    required this.hodName,
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
    var years = await FirebaseFirestore.instance
        .collection('aceDepartments')
        .doc("it")
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
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondBackgroundColor,
      drawerEnableOpenDragGesture: false,
      endDrawer: DepartmentDrawerWidget(department: widget.department),
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
        title: Text(
          widget.department,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 16,
                color: white,
                letterSpacing: 0.5,
                fontWeight: FontWeight.normal),
          ),
        ),
        backgroundColor: secondBackgroundColor,
      ),
      body: Center(
        child: Column(
          children: [
            // Container(
            //   margin: const EdgeInsets.only(top: 50),
            //   child: Image.asset(
            //     'assets/images/department_it.png',
            //   ),
            // ),
            Container(
              width: 300,
              height: 50,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: const Text(
                "Information and Technology",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              width: 300,
              child: const Text(
                "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation",
                style: TextStyle(
                    color: Color.fromARGB(255, 123, 124, 126), fontSize: 17),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                children: [
                  blockTitle("Select your Year"),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(30, 20, 10, 10),
                  //   // child: Row(
                  //   //   children: [
                  //       // yearSelect("1st"),
                  //       // yearSelect("2nd"),
                  //       // yearSelect("3rd"),
                  //       // yearSelect("4th")
                  //     // ],
                  //   ),
                  // )
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: Container(
                margin: EdgeInsets.only(
                  left: 25,
                ),
                // height: 150,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: years.length,
                  shrinkWrap: true,
                  // physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return YearButton(year: years[index].year
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
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                children: [
                  blockTitle("HOD DESK"),
                  HodCard(
                    imagePath: widget.hodImageUrl,
                    description:
                        "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                    title: widget.hodName,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget blockTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget yearSelect(String year) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.red,
            width: 1,
          )),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {},
        child: Text(
          year,
          style: const TextStyle(
            color: Color.fromARGB(255, 252, 87, 59),
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
