import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),

         
        ],
      ),
    );
  }
}



class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: _SliverCustomHeaderDelegate(
            child: Container(
              alignment: Alignment.centerLeft,
              child: _Titulo(),
              color: Colors.white,
            ),
            maxHeight: 200,
            minHeight: 184
          ),
          floating: true
        ),

        SliverList(
          delegate: SliverChildListDelegate([
            ...items,

            SizedBox( height: 100 )
          ])
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  _SliverCustomHeaderDelegate({
    required this.child, 
    required this.maxHeight, 
    required this.minHeight
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand( child: child );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || 
      minHeight != oldDelegate.minHeight ||
      child != oldDelegate.child;
  }

}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox( height: 30 ),

        Container(
          child: Text(
            'New',
            style: TextStyle( color: Color(0xff532128), fontSize: 50 ),
          ),
          margin: EdgeInsets.symmetric( horizontal: 30, vertical: 10 ),
        ),

        Stack(
          children: [
            SizedBox( width: 100 ),

            Positioned(
              bottom: 8,
              child: Container(
                color: Color(0xffF7CDD5),
                height: 8,
                width: 150,
              )
            ),

            Container(
              child: Text(
                'List',
                style: TextStyle( color: Color(0xffD93A30), fontSize: 50, fontWeight: FontWeight.bold ),
              ),
            )
          ]
        )
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {
  final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ( BuildContext context, int index ) => items[index],
      itemCount: items.length
    );
  }
}

class _ListItem extends StatelessWidget {
  final Color color;
  final String titulo;

  const _ListItem(
    this.titulo,
    this.color
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        titulo,
        style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular( 30 ),
        color: color
      ),
      height: 130,
      margin: EdgeInsets.all( 10 ),
      padding: EdgeInsets.all( 30 ),
    );
  }
}