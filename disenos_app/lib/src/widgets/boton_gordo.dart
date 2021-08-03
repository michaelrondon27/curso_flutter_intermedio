import 'package:flutter/material.dart';

class BotonGordo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _BotonGordoBackground();
  }
}

class _BotonGordoBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
