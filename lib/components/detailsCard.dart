import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/colors.dart';

class DetailsCard extends StatelessWidget {
  final name;
  final role;
  final image;
  DetailsCard(
      {super.key, required this.name, required this.role, required this.image});

  @override
  Widget build(BuildContext context) {
    return role == "null"
        ? ListTile(
            tileColor: backgroundColor,
            contentPadding: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            leading: SizedBox(
              height: 60,
              width: 60,
              child: image == "null"
                  ? Image.asset("assets/images/admission.png")
                  : CachedNetworkImage(imageUrl: image),
            ),
            title: Text(
              name,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 14,
                    color: black,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        : ListTile(
            tileColor: backgroundColor,
            contentPadding: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            leading: SizedBox(
              height: 60,
              width: 60,
              child: image == "null"
                  ? Image.asset("assets/images/admission.png")
                  : CachedNetworkImage(imageUrl: image),
            ),
            title: Text(
              name,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 14,
                    color: black,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Text(
              role,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 12,
                    color: black,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.normal),
              ),
            ),
          );
  }
}
