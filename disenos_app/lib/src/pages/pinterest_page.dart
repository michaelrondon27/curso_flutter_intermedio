import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:disenos_app/src/widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      body: Stack(
        children: [
          PinterestGrid(),

          _PinterestMenuLocation()
        ],
      )
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthPantalla = MediaQuery.of(context).size.width;

    return Positioned(
      bottom: 30,
      child: Container(
        child: Align(
          child: PinterestMenu()
        ),
        width: widthPantalla
      )
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, ( i ) => i);

  ScrollController controller = new ScrollController();

  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      if ( controller.offset > scrollAnterior ) {

      } else {

      }

      scrollAnterior = controller.offset;
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      crossAxisSpacing: 4.0,
      itemBuilder: ( BuildContext context, int index ) => _PinterestItem( index ),
      itemCount: items.length,
      mainAxisSpacing: 4.0,
      staggeredTileBuilder: ( int index ) => StaggeredTile.count(
        2, 
        index.isEven ? 2 : 3
      )
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  
  _PinterestItem( this.index );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index')
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all( Radius.circular( 30 ) ),
        color: Colors.blue,
      ),
      margin: EdgeInsets.all( 5 ),
    );
  }
}
