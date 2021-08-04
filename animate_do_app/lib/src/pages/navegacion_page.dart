import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          centerTitle: true,
          title: Text('Notifications PAge'),
        ),
        bottomNavigationBar: BottomNavigation(),
        floatingActionButton: BotonFlotante(),
      ),
      create: ( _ ) => _NotificationModel(),
    );
  }
}

class BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: FaIcon( FontAwesomeIcons.play ),
      onPressed: () {
        int numero = Provider.of<_NotificationModel>(context, listen: false).numero;

        numero++;

        Provider.of<_NotificationModel>(context, listen: false).numero = numero;
      },
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(context).numero;

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
                  child: Text('$numero', style: TextStyle( color: Colors.white, fontSize: 7)),
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

class _NotificationModel with ChangeNotifier {
  int _numero = 0;

  int get numero => this._numero;

  set numero( int value ) {
    this._numero = value;

    notifyListeners();
  }
}
