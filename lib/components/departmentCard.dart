import 'package:agi_app/screens/departments.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'college_tile.dart';

class DepartmentCardModel {
  final String name;
  final String image;
  final String department;
  final String hodImageUrl;
  final String hodName;
  final String college;
  final String desc;
  final String hodDesc;
  final String banner;

  const DepartmentCardModel({
    required this.name,
    required this.image,
    required this.department,
    required this.hodImageUrl,
    required this.hodName,
    required this.college,
    required this.desc,
    required this.hodDesc,
    required this.banner,
  });
}

class DepartmentCard extends StatefulWidget {
  final college;
  const DepartmentCard({super.key, required String this.college});

  @override
  State<DepartmentCard> createState() => _DepartmentCardState();
}

class _DepartmentCardState extends State<DepartmentCard> {
  List<DepartmentCardModel> departments = [];
  bool isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    fetchInstitutes();
    super.initState();
  }

  fetchInstitutes() async {
    var departments =
        await FirebaseFirestore.instance.collection('aceDepartments').get();
    mapColleges(departments);
    print(departments);
  }

  mapColleges(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map(
          (item) => DepartmentCardModel(
              name: item["name"],
              image: item["image"],
              department: item["department"],
              hodImageUrl: item["hodImageUrl"],
              hodName: item["hodName"],
              desc: item["desc"],
              hodDesc: item["hodDesc"],
              banner: item["banner"],
              college: widget.college
              // id: int.parse(item["subtitle"]),
              // urlImage: item["urlImage"],
              // logo: item["logo"],
              ),
        )
        .toList();
    print("Lenghth years");
    print(_list.length);
    setState(() {
      isLoaded = true;
      departments = _list;
    });
  }

  Widget build(BuildContext context) {
    return isLoaded
        ? Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 5, left: 15, bottom: 10),
                height: 150,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: departments.length,
                  shrinkWrap: true,
                  // physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Colleges(
                        path: departments[index].image,
                        id: index,
                        onClicked: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DepartmentScreen(
                                title: departments[index].name,
                                hodImageUrl: departments[index].hodImageUrl,
                                hodName: departments[index].hodName,
                                department: departments[index].department,
                                college: departments[index].college,
                                desc: departments[index].desc,
                                hodDesc: departments[index].hodDesc,
                                banner: departments[index].banner,
                              ),
                            ),
                          );
                        }
                        // selectedItem(context, clgList[index].id),
                        );
                  },
                ),
              ),
            ],
          )
        : Container(
            margin: EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: Center(child: CircularProgressIndicator()),
            ),
          );
  }
}
