import 'package:flutter/material.dart';

class DeptBanner extends StatefulWidget {
  const DeptBanner({Key? key}) : super(key: key);

  @override
  State<DeptBanner> createState() => _DeptBannerState();
}

class _DeptBannerState extends State<DeptBanner> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 180,
            width: 380,
            color: Color(0xff1B1E23),
            foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff232f31).withOpacity(0.5),
                    // Color(0xffF0F0F0).withOpacity(0.5),
                    Color(0xfff2644C).withOpacity(0.05),
                    // Color.fromRGBO(252, 87, 59, 1),
                  ],
                  stops: [0, 0.9],
                )),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.only( right: 180, top: 20),
              child: Image.asset('assets/colleges/en.png', scale: 2.5,),
            ),
            Container(
              width: 250,
              margin: EdgeInsets.only(top: 40, left: 15, bottom: 25 ),
              child: Text('Information and Technology', style: TextStyle(color: Color(0xfff2644C), fontWeight: FontWeight.w500, fontSize: 20,),),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 170, bottom: 30),
          child: Image.asset('assets/images/ItDept.png', scale: 1,),
        ),
      ],
    )
      ;
  }
}
