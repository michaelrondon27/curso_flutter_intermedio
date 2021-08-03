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
        child: _MenuItems( items ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all( Radius.circular( 100 ) ),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black38,
              spreadRadius: -5
            )
          ],
          color: Colors.white
        ),
        height: 60,
        width: 250
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItems( this.menuItems );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate( menuItems.length, (i) => _PinteresMenuButton( i, menuItems[i] )),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}

class _PinteresMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinteresMenuButton( this.index, this.item );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon( item.icon ),
    );
  }
}
