import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/theme/theme.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),

          Positioned(
            bottom: -10,
            child: _BotonNewList(),
            right: 0,
          )
        ],
      ),
    );
  }
}

class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final appTheme = Provider.of<ThemeChanger>(context);

    return ButtonTheme(
      child: ElevatedButton (
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>( ( appTheme.darkTheme ) ? appTheme.currentTheme.accentColor : Color(0xffED6762)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder> (
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
            )
          )
        ),
        child: Container(
          height: size.height * 0.1,
          width: size.width * 0.7,
          child: Center(
            child: Text(
              'CREATE A NEW LIST',
              style: TextStyle(
                color: appTheme.currentTheme.scaffoldBackgroundColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2
              ),
            ),
          ),
        ),
        onPressed: (){}
      )  
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
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: _SliverCustomHeaderDelegate(
            child: Container(
              alignment: Alignment.centerLeft,
              child: _Titulo(),
              color: appTheme.scaffoldBackgroundColor,
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
    final appTheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: [
        SizedBox( height: 30 ),

        Container(
          child: Text(
            'New',
            style: TextStyle(
              color: ( appTheme.darkTheme ) ? Colors.grey : Color(0xff532128),
              fontSize: 50
            ),
          ),
          margin: EdgeInsets.symmetric( horizontal: 30, vertical: 10 ),
        ),

        Stack(
          children: [
            SizedBox( width: 100 ),

            Positioned(
              bottom: 8,
              child: Container(
                color: ( appTheme.darkTheme ) ? Colors.grey : Color(0xffF7CDD5),
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
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        titulo,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular( 30 ),
        color: ( appTheme.darkTheme ) ? Colors.grey : color
      ),
      height: 130,
      margin: EdgeInsets.all( 10 ),
      padding: EdgeInsets.all( 30 ),
    );
  }
}