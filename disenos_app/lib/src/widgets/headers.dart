import 'package:flutter/material.dart';

class HeaderBorderRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular( 70 ), bottomRight: Radius.circular( 70 ) ),
        color: Color(0xff625AAB),
      ),
      height: 300,
    );
  }
}

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff625AAB),
      height: 300,
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff625AAB),
      height: 300,
    );
  }
}
