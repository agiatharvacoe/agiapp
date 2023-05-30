import 'package:flutter/material.dart';

class VirtualClassroom extends StatefulWidget {
  const VirtualClassroom({super.key});

  @override
  State<VirtualClassroom> createState() => _VirtualClassroomState();
}

class _VirtualClassroomState extends State<VirtualClassroom> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("VirtualClassroom"),
    );
  }
}
