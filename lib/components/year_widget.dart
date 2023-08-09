import 'package:agi_app/components/year_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DepartmentCardModel {
  final String title;
  // final String image;
  // final String department;
  // final String hodImageUrl;
  // final String hodName;

  const DepartmentCardModel({
    required this.title,
    // required this.image,
    // required this.department,
    // required this.hodImageUrl,
    // required this.hodName,
  });
}

class YearWidget extends StatefulWidget {
  final college;
  const YearWidget({super.key, required String this.college});

  @override
  State<YearWidget> createState() => _YearWidgetState();
}

class _YearWidgetState extends State<YearWidget> {
  List<DepartmentCardModel> years = [];
  bool isLoaded = false;
  void initState() {
    // TODO: implement initState
    fetchYears();
    super.initState();
  }

  fetchYears() async {
    var departments = await FirebaseFirestore.instance
        .collection('colleges')
        .doc(widget.college)
        .collection("years")
        .get();
    mapColleges(departments);
    print(departments);
  }

  mapColleges(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map(
          (item) => DepartmentCardModel(
            title: item["title"],
            // image: item["image"],
            // department: item["department"],
            // hodImageUrl: item["hodImageUrl"],
            // hodName: item["hodName"],
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
      years = _list;
    });
  }

  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          // margin: EdgeInsets.only(
          //   left: 5,
          // ),
          height: 100,
          width: double.infinity,
          child: ListView.builder(
            itemCount: years.length,
            shrinkWrap: true,
            // physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return YearButton(
                year: years[index].title, department: "none",
                college: widget.college,
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
      ],
    );
  }
}
