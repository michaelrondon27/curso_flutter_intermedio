import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:disenos_app/src/theme/theme.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLarge = false;

    if ( MediaQuery.of(context).size.height > 500 ) {
      isLarge = true;
    }

    final children = [
      Expanded(
        child: miSlideshow()
      ),

      Expanded(
        child: miSlideshow()
      )
    ];

    return Scaffold(
      body: ( isLarge )
        ? Column(children: children)
        : Row(children: children)
    );
  }
}

class miSlideshow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    final accentColor = appTheme.currentTheme.accentColor;
    
    return Slideshow(
      bulletPrimario: 18.0,
      bulletSecundario: 12.0,
      colorPrimario: ( appTheme.darkTheme ) ? accentColor : Color(0xffFF5A7E),
      // colorSecundario: Colors.purple,
      // puntosArriba: true,
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg')
      ],
    );
  }
}