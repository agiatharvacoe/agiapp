import 'package:agi_app/common/strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Notices extends StatefulWidget {
  Notices({Key? key}) : super(key: key);

  @override
  State<Notices> createState() => _NoticesState();
}

class _NoticesState extends State<Notices> {
  final bg = Color.fromRGBO(252, 87, 59, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Container(
        width: 350,
        height: 90,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
              side: BorderSide(width: 1, color: bg)
          ),
          color: Color.fromRGBO(27, 30, 35, 0.5),
          child: Container(
            child: ListTile(
              horizontalTitleGap: 10,
              leading: Container(
                margin: EdgeInsets.only(top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Container(
                    // margin: EdgeInsets.symmetric(vertical: 5),
                      width: 50,
                      // height: 50,
                      color: bg,
                      child: Image.asset('assets/images/notice.png')),
                ),
              ),
              // contentPadding: EdgeInsets.all(10),
              trailing: Image.asset('assets/images/cross.png', width: 20, color: Colors.grey,),
              title: Text("Department notices", style: TextStyle(fontSize: 15, fontFamily: "Poppins", fontWeight: FontWeight.w600, color: Colors.white),),
              subtitle: Text("Some short description about the notice", style: TextStyle(fontSize: 10, fontFamily: "Poppins", fontWeight: FontWeight.w400, color: Colors.white),),

              // mainAxisAlignment: MainAxisAlignment.center,

              // Container(
              //   height: 45,
              //   width: 45,
              //   color: bg,
              //   margin: const EdgeInsets.all(5),
              //   padding: const EdgeInsets.all(5),

            ),
            // Container(
            //     margin: const EdgeInsets.only(left: 12, top: 8, right: 5, bottom: 5),
            //     child: const Text(
            //       "Department Notices",
            //       style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12, fontFamily: 'Poppins', height: 1.025),
            //     ),
            // ),

          ),
        ),
      ),
    );
  }
}
