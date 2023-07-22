import 'package:agi_app/common/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrincipalCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const PrincipalCard(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Color.fromARGB(255, 217, 217, 217),
          child: Container(
            margin: const EdgeInsets.all(5),
            child: ListTile(
              tileColor: backgroundColor,
              contentPadding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              leading: SizedBox(
                height: 60,
                width: 60,
                child: CachedNetworkImage(imageUrl: imagePath),
              ),
              title: Text(
                title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 14,
                      color: black,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Text(
                description,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 12,
                      color: black,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          )
          // child: Column(
          //   children: [
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Container(
          //       padding: EdgeInsets.all(10),
          //       height: 100,
          //       child: Row(
          //         children: [
          //           Container(
          //             height: 100,
          //             padding: EdgeInsets.all(10),
          //             child: CachedNetworkImage(imageUrl: imagePath),
          //           ),
          //           Container(
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 Text(
          //                   title,
          //                   textAlign: TextAlign.justify,
          //                   style: GoogleFonts.poppins(
          //                     textStyle: TextStyle(fontSize: 12, color: black),
          //                   ),
          //                 ),
          //                 Expanded(
          //                   child: Container(
          //                     width: 200,
          //                     child: Text(
          //                       description,
          //                       textAlign: TextAlign.justify,
          //                       style: GoogleFonts.poppins(
          //                         textStyle: TextStyle(fontSize: 10, color: black),
          //                       ),
          //                     ),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
