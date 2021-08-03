import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final IconData icon;
  final onPressed;

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
  final bool mostrar;

  PinterestMenu({
    this.mostrar: true
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: AnimatedOpacity(
        child: _PinterestMenuBackground( 
          child: _MenuItems( items )
        ),
        duration: Duration( milliseconds: 250 ),
        opacity: ( mostrar ) ? 1 : 0,
      ),
      create: ( _ ) => _MenuModel(),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  _PinterestMenuBackground({ required this.child });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
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
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          color: ( itemSeleccionado == index ) ? Colors.black : Colors.blueGrey,
          size: ( itemSeleccionado == index ) ? 35 : 25
        ),
      ),
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;

        item.onPressed();
      },
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado( int value ) {
    this._itemSeleccionado = value;

    notifyListeners();
  }
}
