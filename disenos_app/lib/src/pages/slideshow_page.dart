import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:disenos_app/src/widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slideshow(
        slides: [
          SvgPicture.asset('assets/svgs/slide-1.svg'),
          SvgPicture.asset('assets/svgs/slide-2.svg'),
          SvgPicture.asset('assets/svgs/slide-3.svg'),
          SvgPicture.asset('assets/svgs/slide-4.svg'),
          SvgPicture.asset('assets/svgs/slide-5.svg')
        ],
      )
    );
  }
}