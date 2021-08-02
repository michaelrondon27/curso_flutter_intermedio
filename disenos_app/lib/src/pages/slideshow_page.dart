import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: _Slides()
            ),

            _Dots()
          ]
        )
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          _Dot(),
          
          _Dot(),

          _Dot(),
        ],
        mainAxisAlignment: MainAxisAlignment.center
      ),
      height: 70,
      width: double.infinity
    );
  }
}

class _Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle
      ),
      height: 12,
      margin: EdgeInsets.symmetric( horizontal: 5 ),
      width: 12
    );
  }
}

class _Slides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: [
          _Slide( 'assets/svgs/slide-1.svg' ),

          _Slide( 'assets/svgs/slide-2.svg' ),

          _Slide( 'assets/svgs/slide-3.svg' ),
        ]
      )
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;

  const _Slide( this.svg );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset( svg ),
      height: double.infinity,
      padding: EdgeInsets.all( 30 ),
      width: double.infinity  
    );
  }
}
