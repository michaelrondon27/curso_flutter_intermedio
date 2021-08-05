import 'package:flutter/material.dart';

class ZapatoSizePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Container(
        child: Column(
          children: [
            _ZapatoConSombra()
          ]
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( 50 ),
          color: Color(0xffFFCF53)
        ),
        height: 430,
        width: double.infinity,
      ),
      padding: EdgeInsets.symmetric( horizontal: 30, vertical: 5 ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Stack(
        children: [
          Image(image: AssetImage('assets/imgs/azul.png'))
        ]
      ),
      padding: EdgeInsets.all( 50 ),
    );
  }
}