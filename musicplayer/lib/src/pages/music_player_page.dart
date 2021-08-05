import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:musicplayer/src/helpers/helpers.dart';
import 'package:musicplayer/src/widgets/custom_appbar.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),

          _ImagenDiscoDuration(),

          _TituloPlay(),

          Expanded(
            child: _Lyrics()
          )
        ]
      )
    );
  }
}

class _Lyrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lyrics = getLyrics();

    return Container(
      child: ListWheelScrollView(
        children: lyrics.map((linea) => Center(
          child: Text(
            linea,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.8)
            )
          ),
        )).toList(),
        diameterRatio: 2,
        itemExtent: 42,
        physics: BouncingScrollPhysics()
      )
    );
  }
}

class _TituloPlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'Reminder',
                style: TextStyle( color: Colors.white.withOpacity( 0.8 ), fontSize: 30 )
              ),

              Text(
                'The Weeknd',
                style: TextStyle( color: Colors.white.withOpacity( 0.8 ), fontSize: 15 )
              )
            ]
          ),

          Spacer(),

          FloatingActionButton(
            backgroundColor: Color(0xffE90532),
            child: Icon( FontAwesomeIcons.play ),
            elevation: 0,
            highlightElevation: 0,
            onPressed: () {},
          )
        ]
      ),
      margin: EdgeInsets.only( top: 40 ),
      padding: EdgeInsets.symmetric( horizontal: 50 )
    );
  }
}

class _ImagenDiscoDuration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          _ImagenDisco(),

          SizedBox( width: 30 ),

          _BarraProgreso(),

          SizedBox( width: 20 ),
        ]
      ),
      margin: EdgeInsets.only( top: 70 ),
      padding: EdgeInsets.symmetric( horizontal: 20 ),
    );
  }
}

class _BarraProgreso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final estilo = TextStyle( color: Colors.white.withOpacity( 0.4 ));

    return Container(
      child: Column(
        children: [
          Text(
            '00:00',
            style: estilo,
          ),

          SizedBox( height: 10 ),

          Stack(
            children: [
              Container(
                color: Colors.white.withOpacity( 0.1 ),
                height: 230,
                width: 3
              ),

              Positioned(
                bottom: 0,
                child: Container(
                  color: Colors.white.withOpacity( 0.8 ),
                  height: 100,
                  width: 3
                ),
              )
            ]
          ),

          SizedBox( height: 10 ),

          Text(
            '00:00',
            style: estilo,
          )
        ]
      )
    );
  }
}

class _ImagenDisco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular( 200 ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(image: AssetImage('assets/starboy.jpg')),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular( 100 ),
                color: Color(0xffE90532)
              ),
              height: 10,
              width: 10
            )
          ]
        )
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular( 200 ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff060D3C),
            Color(0xffE90532)
          ]
        )
      ),
      height: 250,
      padding: EdgeInsets.all( 20 ),
      width: 250
    );
  }
}