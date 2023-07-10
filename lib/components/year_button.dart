import 'package:flutter/material.dart';

class YearButton extends StatefulWidget {
  final year;
  const YearButton({super.key, required String this.year});

  @override
  State<YearButton> createState() => _YearButtonState();
}

class _YearButtonState extends State<YearButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.year);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(10, 18, 10, 18),
        width: 60,
        height: 0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.red,
              width: 1,
            )),
        child: Text(
          widget.year,
          style: const TextStyle(
            color: Color.fromARGB(255, 252, 87, 59),
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
