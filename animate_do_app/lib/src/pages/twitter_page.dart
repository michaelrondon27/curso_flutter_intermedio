import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1DA1F2),
      body: Center(
        child: ZoomOut(
          animate: false,
          child: FaIcon( FontAwesomeIcons.twitter, color: Colors.white, size: 40 ),
          duration: Duration( seconds: 1 ),
          from: 30
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: FaIcon( FontAwesomeIcons.play ),
        onPressed: () {},
      ),
    );
  }
}