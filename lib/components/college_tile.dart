import 'package:agi_app/common/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Colleges extends StatelessWidget {
  final path, id;
  void Function()? onClicked;
  Colleges({required this.path, required this.id, required this.onClicked});
  @override
  Widget build(BuildContext context) {
    const bg = white;
    return Container(
      height: 500,
      child: Container(
        height: 300,
        padding: const EdgeInsets.only(right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
              color: bg,
              // height: 140,
              width: 150,
              height: 130,
              child: GestureDetector(
                  onTap: onClicked,
                  child: Image.network(
                    path,
                    fit: BoxFit.scaleDown,
                    scale: 1.5,
                  ))),
        ),
      ),
    );
  }
}
