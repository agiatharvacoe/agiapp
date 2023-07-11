import 'package:agi_app/common/colors.dart';
import 'package:agi_app/screens/class_year.dart';
import 'package:flutter/material.dart';

class YearButton extends StatefulWidget {
  final year;
  final department;
  final college;
  const YearButton(
      {super.key,
      required String this.year,
      required String this.department,
      required this.college});

  @override
  State<YearButton> createState() => _YearButtonState();
}

class _YearButtonState extends State<YearButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.college);
        print(widget.year);
        print(widget.department);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => YearScreen(
            college: widget.college,
            year: widget.year,
            department: widget.department,
          ),
        ));
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(10, 18, 10, 18),
        width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: lightOrange,
              width: 1,
            )),
        child: Text(
          widget.year,
          style: const TextStyle(
            color: orange,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
