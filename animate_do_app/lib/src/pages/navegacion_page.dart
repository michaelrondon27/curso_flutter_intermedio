import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavegacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: Text('Notifications PAge'),
      ),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: BotonFlotante(),
    );
  }
}

class BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: FaIcon( FontAwesomeIcons.play ),
      onPressed: () {},
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: FaIcon( FontAwesomeIcons.bone ),
          label: 'Bones'
        ),

        BottomNavigationBarItem(
          icon: Stack(
            children: [
              FaIcon( FontAwesomeIcons.bell ),

              Positioned(
                child: Container(
                  alignment: Alignment.center,
                  child: Text('1', style: TextStyle( color: Colors.white, fontSize: 7)),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle
                  ),
                  height: 12,
                  width: 12
                ),
                right: 0,
                top: 0
              )
            ]
          ),
          label: 'Notifications'
        ),

        BottomNavigationBarItem(
          icon: FaIcon( FontAwesomeIcons.dog ),
          label: 'My Dog'
        )
      ],
      selectedItemColor: Colors.pink,
    );
  }
}
