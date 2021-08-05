import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shoes_app/src/models/zapato_model.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                child: ZapatoSizePreview(
                  fullScreen: true
                ),
                tag: 'zapato-1',
              ),

              Positioned(
                child: FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  child: Icon( Icons.chevron_left, color: Colors.white, size: 60 ),
                  elevation: 0,
                  highlightElevation: 0,
                  onPressed: () => Navigator.pop( context ),
                ),
                top: 80
              )
            ],
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

                  _ColoresYmas(),

                  _BotonesLikeCartSettings()
                ]
              )
            )
          )
        ]
      )
    );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          _BotonSombreado( Icon( Icons.star, color: Colors.red, size: 25 ) ),
          
          _BotonSombreado( Icon( Icons.add_shopping_cart, color: Colors.grey.withOpacity( 0.4 ), size: 25 ) ),

          _BotonSombreado( Icon( Icons.settings, color: Colors.grey.withOpacity( 0.4 ), size: 25 ) ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      margin: EdgeInsets.symmetric( vertical: 15 ),
      padding: EdgeInsets.symmetric( horizontal: 30 )
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;

  _BotonSombreado( this.icon );
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icon,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black12,
            offset: Offset(0, 10),
            spreadRadius: -5
          )
        ],
        color: Colors.white,
        shape: BoxShape.circle
      ),
      height: 55,
      width: 55
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
                  child: _BotonColor( Color(0xffC6D642), 4 , 'assets/imgs/verde.png'),
                  left: 90
                ),

                Positioned(
                  child: _BotonColor( Color(0xffFFAD29), 3, 'assets/imgs/amarillo.png' ),
                  left: 60
                ),
                
                Positioned(
                  child: _BotonColor( Color(0xff2099F1), 2, 'assets/imgs/azul.png' ),
                  left: 30
                ),
                
                _BotonColor( Color(0xff364D56), 1, 'assets/imgs/negro.png' ),
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
  final int index;
  final String urlImagen;

  _BotonColor( this.color, this.index, this.urlImagen );

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          ),
          height: 45,
          width: 45
        ),
        onTap: () => Provider.of<ZapatoModel>(context, listen: false).assetImage = this.urlImagen,
      ),
      delay: Duration( milliseconds: this.index * 100 ),
      duration: Duration( milliseconds: 300 ),
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

            Bounce(
              child: BotonNaranja(
                alto: 40,
                ancho: 120,
                texto: 'Buy Now',
              ),
              delay: Duration(seconds: 1 ),
              from: 8,
            )
          ]
        ),
        margin: EdgeInsets.only( top: 20 ),
      ),
      padding: EdgeInsets.symmetric( horizontal: 30 )
    );
  }
}