import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _BotonGordoBackground(),

        Row(
          children: [
            SizedBox( height: 140, width: 40 ),

            FaIcon(
              FontAwesomeIcons.carCrash,
              color: Colors.white,
              size: 40
            ),

            SizedBox( width: 20 ),

            Expanded(
              child: Text(
                'Motor Accident',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),  
              ),
            ),

            FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.white
            ),

            SizedBox( width: 40 )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        )
      ],
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular( 15 ),
        child: Stack(
          children: [
            Positioned(
              child: FaIcon(
                FontAwesomeIcons.carCrash,
                color: Colors.white.withOpacity( 0.2 ),
                size: 150
              ),
              right: -20,
              top: -20
            )
          ]
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular( 15 ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity( 0.2 ),
            offset: Offset(4, 6)
          )
        ],
        gradient: LinearGradient(
          colors: [
            Color(0xff6989F5),
            Color(0xff906EF5)
          ]
        )
      ),
      margin: EdgeInsets.all( 20 ),
      height: 100,
      width: double.infinity,
    );
  }
}
