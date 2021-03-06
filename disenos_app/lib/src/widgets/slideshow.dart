import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final double bulletPrimario;
  final double bulletSecundario;  
  final Color colorPrimario;
  final Color colorSecundario;
  final bool puntosArriba;
  final List<Widget> slides;

  Slideshow({
    this.bulletPrimario  : 12.0,      
    this.bulletSecundario: 12.0,        
    this.colorPrimario   : Colors.blue,
    this.colorSecundario : Colors.grey,
    this.puntosArriba    : false,
    required this.slides
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: ( BuildContext context ) {
              Provider.of<_SlidershowModel>(context).bulletPrimario = this.bulletPrimario;
              Provider.of<_SlidershowModel>(context).bulletSecundario = this.bulletSecundario;
              Provider.of<_SlidershowModel>(context).colorPrimario = this.colorPrimario;
              Provider.of<_SlidershowModel>(context).colorSecundario = this.colorSecundario;

              return _CrearEstructuraSlideshow(
                puntosArriba: puntosArriba, 
                slides: slides
              );
            },
          )
        ),
      ),
      create: ( _ ) => new _SlidershowModel(),
    );
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  final bool puntosArriba;
  final List<Widget> slides;

  _CrearEstructuraSlideshow({
    Key? key,
    required this.puntosArriba,
    required this.slides,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if ( this.puntosArriba ) 
          _Dots( this.slides.length ),

        Expanded(
          child: _Slides( this.slides )
        ),
        
        if ( !this.puntosArriba ) 
          _Dots( this.slides.length )
      ]
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  _Dots( this.totalSlides );
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: List.generate( this.totalSlides, ( i ) => _Dot( i ) ),
        mainAxisAlignment: MainAxisAlignment.center
      ),
      height: 70,
      width: double.infinity
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot( this.index );

  @override
  Widget build(BuildContext context) {
    Color color;
    final ssModel = Provider.of<_SlidershowModel>(context);
    double tamano;

    if ( ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5 ) {
      color = ssModel.colorPrimario;

      tamano = ssModel.bulletPrimario;
    } else {
      color = ssModel.colorSecundario;

      tamano = ssModel.bulletSecundario;
    }


    return AnimatedContainer(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
      duration: Duration( milliseconds: 200 ),
      height: tamano,
      margin: EdgeInsets.symmetric( horizontal: 5 ),
      width: tamano
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides( this.slides );

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlidershowModel>(context, listen: false).currentPage = pageViewController.page!;
    });
    
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: widget.slides.map( ( slide ) => _Slide( slide )).toList(),
        controller: pageViewController
      )
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide( this.slide );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: slide,
      height: double.infinity,
      padding: EdgeInsets.all( 30 ),
      width: double.infinity  
    );
  }
}

class _SlidershowModel with ChangeNotifier {
  double _bulletPrimario = 12.0;  
  double _bulletSecundario = 12.0;  
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _currentPage = 0;

  double get bulletPrimario => this._bulletPrimario;

  set bulletPrimario( double value ) {
    this._bulletPrimario = value;
  }

  double get bulletSecundario => this._bulletSecundario;

  set bulletSecundario( double value ) {
    this._bulletSecundario = value;
  }

  Color get colorPrimario => this._colorPrimario;

  set colorPrimario( Color value ) {
    this._colorPrimario = value;
  }

  Color get colorSecundario => this._colorSecundario;

  set colorSecundario( Color value ) {
    this._colorSecundario = value;
  }

  double get currentPage => this._currentPage;

  set currentPage( double value ) {
    this._currentPage = value;

    notifyListeners();
  }
}
