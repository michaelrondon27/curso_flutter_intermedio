import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final IconData icon;
  final Function() onPressed;

  PinterestButton({
    required this.icon,
    required this.onPressed
  });
}

class PinterestMenu extends StatelessWidget {
  final Color activeColor;
  
  final Color backgroundColor;

  final Color inactiveColor;

  final List<PinterestButton> items;

  final bool mostrar;

  PinterestMenu({
    this.activeColor: Colors.black, 
    this.backgroundColor: Colors.white, 
    this.inactiveColor: Colors.blueGrey,
    required this.items,
    this.mostrar: true,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: AnimatedOpacity(
        child: Builder(
          builder: ( BuildContext context ) {
            Provider.of<_MenuModel>(context).activeColor = this.activeColor;
            Provider.of<_MenuModel>(context).backgroundColor = this.backgroundColor;
            Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;

            return _PinterestMenuBackground( 
              child: _MenuItems( items )
            );
          }
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
    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

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
        color: backgroundColor
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
    final menuModel = Provider.of<_MenuModel>(context);


    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          color: ( itemSeleccionado == index ) ? menuModel.activeColor : menuModel.inactiveColor,
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
  Color activeColor = Colors.black;
  Color backgroundColor = Colors.white;
  Color inactiveColor = Colors.blueGrey;

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado( int value ) {
    this._itemSeleccionado = value;

    notifyListeners();
  }
}
