import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PinterestGrid()
      ),
    );
  }
}

class PinterestGrid extends StatelessWidget {
  final List<int> items = List.generate(200, ( i ) => i);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
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
