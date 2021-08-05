import 'package:flutter/material.dart';

import 'package:musicplayer/src/widgets/custom_appbar.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),

          _ImagenDiscoDuration()
        ]
      )
    );
  }
}

class _ImagenDiscoDuration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          _ImagenDisco()
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
            Image(image: AssetImage('assets/no-guidance.jpg')),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular( 100 ),
                color: Color(0xff997FED)
              ),
              height: 25,
              width: 25
            )
          ]
        )
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular( 200 ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff997FED),
            Color(0xff3621BA)
          ]
        )
      ),
      height: 250,
      padding: EdgeInsets.all( 20 ),
      width: 250
    );
  }
}