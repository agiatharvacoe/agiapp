import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'college_tile.dart';

class DepartmentCardModel {
  final String name;
  final String image;
  final String documentId;
  // final String logo;
  // final String desc;
  // final int id;I

  const DepartmentCardModel({
    required this.name,
    required this.image,
    required this.documentId,
    // required this.logo,
    // required this.desc,
    // required this.id,
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
            documentId: item["department"],
            // id: int.parse(item["subtitle"]),
            // urlImage: item["urlImage"],
            // logo: item["logo"],
          ),
        )
        .toList();
    print("Lenghth");
    print(_list.length);
    setState(() {
      isLoaded = true;
      departments = _list;
    });
  }

  Widget build(BuildContext context) {
    return Stack(
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => DeptPage(
                    //       name: clgList[index].name,
                    //       desc: clgList[index].desc,
                    //       img: clgList[index].path,
                    //     ),
                    //   ),
                    // );
                  }
                  // selectedItem(context, clgList[index].id),
                  );
            },
          ),
        ),
      ],
    );
  }
}
