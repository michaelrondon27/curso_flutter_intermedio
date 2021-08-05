import 'package:flutter/material.dart';

import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ZapatoSizePreview(
            fullScreen: true
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ZapatoDescripcion(
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                    titulo: 'Nike Air Max 720'
                  ),

                  _MontoBuyNow(),

                  _ColoresYmas()
                ]
              )
            )
          )
        ]
      )
    );
  }
}

class _ColoresYmas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  child: _BotonColor( Color(0xffC6D642) ),
                  left: 90
                ),

                Positioned(
                  child: _BotonColor( Color(0xffFFAD29) ),
                  left: 60
                ),
                
                Positioned(
                  child: _BotonColor( Color(0xff2099F1) ),
                  left: 30
                ),
                
                _BotonColor( Color(0xff364D56) ),
              ]
            )
          ),

          BotonNaranja(
            alto: 30,
            ancho: 170,
            color: Color(0xffFFC675),
            texto: 'More related items'
          )
        ]
      ),
      padding: EdgeInsets.symmetric( horizontal: 30 )
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;

  _BotonColor( this.color );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
      height: 45,
      width: 45
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Container(
        child: Row(
          children: [
            Text(
              '\$180.0',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
              )
            ),

            Spacer(),

            BotonNaranja(
              alto: 40,
              ancho: 120,
              texto: 'Buy Now',
            )
          ]
        ),
        margin: EdgeInsets.only( top: 20 ),
      ),
      padding: EdgeInsets.symmetric( horizontal: 30 )
    );
  }
}