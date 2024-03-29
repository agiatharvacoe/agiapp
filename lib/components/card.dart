import 'package:agi_app/common/strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/college.dart';
import '../screens/institutes.dart';

class CardItem {
  final String urlImage;
  final String title;
  final String subtitle;
  final String logo;
  final String desc;
  final String feesUrl;
  bool hasDepartments;
  final String admissionUrl;
  final String vision;
  final String mission;
  final String college;
  final String principalName;
  final String principalDesc;
  final String principalImage;
  final String departmentsPage;
  // final int id;I

  CardItem({
    required this.urlImage,
    required this.title,
    required this.subtitle,
    required this.logo,
    required this.desc,
    required this.feesUrl,
    required this.hasDepartments,
    required this.admissionUrl,
    required this.vision,
    required this.mission,
    required this.college,
    required this.principalName,
    required this.principalDesc,
    required this.principalImage,
    required this.departmentsPage,
  });
}

class CollegeCard extends StatefulWidget {
  const CollegeCard({super.key});

  @override
  State<CollegeCard> createState() => _CollegeCardState();
}

class _CollegeCardState extends State<CollegeCard> {
  List<CardItem> carouselList = [];
  bool isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    fetchInstitutes();
    super.initState();
  }

  fetchInstitutes() async {
    var colleges =
        await FirebaseFirestore.instance.collection('colleges').get();
    mapColleges(colleges);
    print(colleges);
  }

  mapColleges(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map(
          (item) => CardItem(
            subtitle: item["subtitle"],
            title: item["title"],
            desc: item["desc"],
            feesUrl: item["feesUrl"],
            // id: int.parse(item["subtitle"]),
            hasDepartments: item["hasDepartments"] == "true" ? true : false,
            urlImage: item["urlImage"],
            logo: item["logo"],
            admissionUrl: item["admissionUrl"],
            vision: item["vision"],
            mission: item["mission"],
            college: item["college"],
            principalName: item["principalName"],
            principalDesc: item["principalDesc"],
            principalImage: item["principalImage"],
            departmentsPage: item["departmentsPage"],
          ),
        )
        .toList();
    // print(_list.length);
    setState(() {
      isLoaded = true;
      carouselList = _list;
    });
  }

  // List<CardItem> items = [
  //   CardItem(
  //     urlImage: 'assets/images/hero_image.png',
  //     title: 'ACE',
  //     subtitle: 'Atharva College of Engineering',
  //     logo: 'assets/colleges/en.png',
  //     desc:
  //         "Jorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
  //     id: 0,
  //   ),
  //   CardItem(
  //     urlImage: 'assets/colleges/en.png',
  //     title: 'ACHMCT',
  //     subtitle: 'Atharva College of Hotel Management and Catering Technology',
  //     logo: 'assets/colleges/en.png',
  //     desc:
  //         "Jorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
  //     id: 2,
  //   ),
  //   CardItem(
  //     urlImage: 'assets/colleges/en.png',
  //     title: 'ACHMCT',
  //     subtitle: 'Atharva College of Hotel Management and Catering Technology',
  //     logo: 'assets/colleges/en.png',
  //     desc:
  //         "Jorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
  //     id: 3,
  //   ),
  //   CardItem(
  //     urlImage: 'assets/colleges/en.png',
  //     title: 'ACHMCT',
  //     subtitle: 'Atharva College of Hotel Management and Catering Technology',
  //     logo: 'assets/colleges/en.png',
  //     desc:
  //         "Jorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
  //     id: 4,
  //   ),
  //   CardItem(
  //     urlImage: 'assets/colleges/en.png',
  //     title: 'ACHMCT',
  //     subtitle: 'Atharva College of Hotel Management and Catering Technology',
  //     logo: 'assets/colleges/en.png',
  //     desc:
  //         "Jorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
  //     id: 5,
  //   ),
  // CardItem(
  //     urlImage: 'assets/images/cardBg/AIMS_BG.jpeg',
  //     title: 'AIMS',
  //     subtitle: 'Atharva Institute of Management Studies',
  //     logo: 'assets/images/logos/AIMS.jpeg'),
  // CardItem(
  //     urlImage: 'assets/images/cardBg/ASFA_BG.jpg',
  //     title: 'ASFA',
  //     subtitle: 'Atharva School of Fashion and Arts',
  //     logo: 'assets/images/logos/ASFA.png'),
  // CardItem(
  //     urlImage: 'assets/images/cardBg/AIFT_BG.jpg',
  //     title: 'AIFT',
  //     subtitle: 'Atharva Institute of Film and Television',
  //     logo: 'assets/images/logos/AIFT.jpeg'),
  // CardItem(
  //     urlImage: 'assets/images/cardBg/AIIT_BG.jpg',
  //     title: 'AIIT',
  //     subtitle: 'Atharva Institute of Information Technology',
  //     logo: 'assets/images/logos/AIIT.png'),
  // CardItem(
  //     urlImage: 'assets/images/cardBg/ASB_BG.jpg',
  //     title: 'ASB',
  //     subtitle: 'Atharva School of Business',
  //     logo: 'assets/images/logos/ASB.png'),
  // ];

  Widget build(BuildContext context) {
    return isLoaded
        ? Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            child: Container(
              height: 225,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: carouselList.length,
                separatorBuilder: (context, _) => SizedBox(width: 12.0),
                itemBuilder: (context, index) =>
                    buildCard(item: carouselList[index], i: index),
              ),
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

  Widget buildCard({
    required CardItem item,
    required int i,
  }) =>
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InstitutesWidget(
                name: carouselList[i].subtitle,
                desc: carouselList[i].desc,
                urlImage: carouselList[i].urlImage,
                feesUrl: carouselList[i].feesUrl,
                admissionUrl: carouselList[i].admissionUrl,
                hasDepartments: carouselList[i].hasDepartments,
                vision: carouselList[i].vision,
                mission: carouselList[i].mission,
                college: carouselList[i].college,
                pname: carouselList[i].principalName,
                pimage: carouselList[i].principalImage,
                pdesc: carouselList[i].principalDesc,
                departmentsPage: carouselList[i].departmentsPage,
              ),
            ),
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: 170,
              width: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.black),
              child: CachedNetworkImage(
                imageUrl: item.urlImage,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 80,
              // // right: 16,
              left: 10,
              child: Text(
                item.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 10,
              child: Container(
                width: 130,
                child: Text(item.subtitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5),
              ),
            ),
            Positioned(
              top: 5,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        item.logo,
                      ),
                      fit: BoxFit.contain),
                ),
              ),
            )
          ],
        ),
      );
}
