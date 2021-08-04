import 'package:animate_do/animate_do.dart';
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
        final notiModel = Provider.of<_NotificationModel>(context, listen: false);

        int numero = notiModel.numero;

        numero++;

        notiModel.numero = numero;

        if ( numero >= 2 ) {
          final controller = notiModel.bounceController;

          controller.forward( from: 0.0 );
        }
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
                child: BounceInDown(
                  animate: ( numero > 0 ) ? true : false,
                  child: Bounce(
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
                    controller: (controller) => Provider.of<_NotificationModel>(context).bounceController = controller,
                    from: 10,
                  ),
                  from: 10,
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
  late AnimationController _bounceController;
  int _numero = 0;

  AnimationController get bounceController => this._bounceController;
  
  set bounceController( AnimationController controller ) {
    this._bounceController = controller;

    notifyListeners();
  }

  int get numero => this._numero;

  set numero( int value ) {
    this._numero = value;

    notifyListeners();
  }
}
