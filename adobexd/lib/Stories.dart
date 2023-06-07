import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Drawer.dart';
import '../Login.dart';
class stories extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 40,
        backgroundImage: AssetImage('assets/Taymoor.png'),
      )
    );
  }
}
