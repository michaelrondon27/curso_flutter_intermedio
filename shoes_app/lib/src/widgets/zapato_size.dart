import 'package:flutter/material.dart';

import 'package:shoes_app/src/pages/zapato_desc_page.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;

  ZapatoSizePreview({
    this.fullScreen: false
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        child: Container(
          child: Column(
            children: [
              _ZapatoConSombra(),
    
              if ( !fullScreen )
                _ZapatoTallas()
            ]
          ),
          decoration: BoxDecoration(
            borderRadius: ( !fullScreen )
              ? BorderRadius.circular( 50 )
              : BorderRadius.only( 
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            color: Color(0xffFFCF53)
          ),
          height: ( fullScreen ) ? 410 : 430,
          width: double.infinity,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: ( fullScreen ) ? 5 : 30,
          vertical: ( fullScreen ) ? 0 : 5
        )
      ),
      onTap: () {
        if ( !this.fullScreen ) {
          Navigator.push(context, MaterialPageRoute(builder: ( BuildContext context ) => ZapatoDescPage()));
        }
      },
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            child: _ZapatoSombra(),
            right: 0,
          ),

          Image(image: AssetImage('assets/imgs/azul.png'))
        ]
      ),
      padding: EdgeInsets.all( 50 ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( 100 ),
          boxShadow: [
            BoxShadow( color: Color(0xffEAA14E), blurRadius: 40 )
          ]
        ),
        height: 120,
        width: 230
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Row(
        children: [
          _TallaZapatoCaja( 7 ),
          
          _TallaZapatoCaja( 7.5 ),

          _TallaZapatoCaja( 8 ),
          
          _TallaZapatoCaja( 8.5 ),
          
          _TallaZapatoCaja( 9 ),
          
          _TallaZapatoCaja( 9.5 )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
      padding: EdgeInsets.symmetric( horizontal: 10 ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
  final double numero;

  const _TallaZapatoCaja( this.numero );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        '${ numero.toString().replaceAll(".0", "") }',
        style: TextStyle(
          color: ( this.numero == 9 ) ? Colors.white : Color(0xffF1A23A),
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular( 10 ),
        boxShadow: [
          if ( this.numero == 9 )
            BoxShadow(
              blurRadius: 10,
              color: Color(0xffF1A23A),
              offset: Offset(0, 5)
            )
        ],
        color: ( this.numero == 9 ) ? Color(0xffF1A23A) : Colors.white
      ),
      height: 45,
      width: 45,
    );
  }
}
