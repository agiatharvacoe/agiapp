import 'package:agi_app/screens/institutes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrincipalDesk extends StatefulWidget {
  const PrincipalDesk({super.key});

  @override
  State<PrincipalDesk> createState() => _PrincipalDeskState();
}

class _PrincipalDeskState extends State<PrincipalDesk> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FoundersMessageRoute()),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Container(
                  width: 173,
                  height: 140,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 6, right: 5, top: 4, bottom: 4),
                    child: Image.asset(
                      'assets/images/sunil_rane.png',
                      width: 162,
                      height: 132,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: 171,
                  child: Column(
                    children: [
                      Text(
                        "Dr. Principal",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: Color(0xff09101D),
                          fontSize: 14,
                        )),
                      ),
                      Text(
                        "\nExecutive - President of Atharva Group of Institutes & Founder Secretary - AET",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: Color(0xff383838),
                          fontSize: 10,
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
