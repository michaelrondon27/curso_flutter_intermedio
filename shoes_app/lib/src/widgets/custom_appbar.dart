import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String texto;

  CustomAppBar({ 
    required this.texto
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        child: Container(
          child: Row(
            children: [
              Text(
                this.texto,
                style: TextStyle( fontSize: 30, fontWeight: FontWeight.w700 )
              ),
    
              Spacer(),
    
              Icon( Icons.search, size: 30 )
            ]
          ),
          margin: EdgeInsets.only( top: 30 ),
          width: double.infinity
        ),
        padding: EdgeInsets.symmetric( horizontal: 30 ),
      ),
      top: true
    );
  }
}