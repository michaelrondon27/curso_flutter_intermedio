import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Titulo(),
    );
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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ( BuildContext context, int index ) => _ListItem(),
      itemCount: 20
    );
  }
}

class _ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Orange',
        style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular( 30 ),
        color: Colors.orange
      ),
      height: 130,
      margin: EdgeInsets.all( 10 ),
      padding: EdgeInsets.all( 30 ),
    );
  }
}