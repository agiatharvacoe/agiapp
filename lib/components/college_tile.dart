import 'package:agi_app/common/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
      // height: 100,
      margin: const EdgeInsets.only(right: 20),
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(16),
        child: Container(
          // padding: EdgeInsets.all(10),
          color: secondBackgroundColor,
          width: 160,
          // height: 155,
          child: GestureDetector(
            onTap: onClicked,
            child: CachedNetworkImage(
              imageUrl: path,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.contain,
              // scale: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
