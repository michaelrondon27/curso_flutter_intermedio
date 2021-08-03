import 'package:flutter/material.dart';

class PinterestButton {
  final IconData icon;
  final Function onPressed;

  PinterestButton({
    required this.icon,
    required this.onPressed
  });
}

class PinterestMenu extends StatelessWidget {
  final List<PinterestButton> items = [
    PinterestButton(icon: Icons.pie_chart, onPressed: () {}),
    PinterestButton(icon: Icons.search, onPressed: () {}),
    PinterestButton(icon: Icons.notifications, onPressed: () {}),
    PinterestButton(icon: Icons.supervised_user_circle, onPressed: () {})
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Hola'),
      ),
    );
  }
}