import 'package:agi_app/screens/departments.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'college_tile.dart';

class DepartmentCardModel {
  final String name;
  final String image;
  final String department;
  final String hodImageUrl;
  final String hodName;

  const DepartmentCardModel({
    required this.name,
    required this.image,
    required this.department,
    required this.hodImageUrl,
    required this.hodName,
  });
}

class DepartmentCard extends StatefulWidget {
  const DepartmentCard({super.key});

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
        ? Container(
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
                              department: departments[index].name,
                              hodImageUrl: departments[index].hodImageUrl,
                              hodName: departments[index].hodName),
                        ),
                      );
                    }
                    // selectedItem(context, clgList[index].id),
                    );
              },
            ),
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
