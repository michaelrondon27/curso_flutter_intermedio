import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
      height: double.infinity,
      width: double.infinity
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    lapiz.color = Color(0xff625AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2;

    final path = new Path();
    
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
      height: double.infinity,
      width: double.infinity
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    lapiz.color = Color(0xff625AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2;

    final path = new Path();
    
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
      height: double.infinity,
      width: double.infinity
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    lapiz.color = Color(0xff625AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path = new Path();
    
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.3);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
      height: double.infinity,
      width: double.infinity
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    lapiz.color = Color(0xff625AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path = new Path();
    
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.4, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
      height: double.infinity,
      width: double.infinity
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    lapiz.color = Color(0xff625AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path = new Path();
    
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.3, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaveGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(),
      ),
      height: double.infinity,
      width: double.infinity
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = new Rect.fromCircle(
      center: Offset(0.0, 55.0), 
      radius: 180
    );

    final Gradient gradiente = new LinearGradient(
      begin: Alignment.topCenter,
      colors: [
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA)
      ],
      end: Alignment.bottomCenter,
      stops: [
        0.2,
        0.5,
        1.0
      ]
    );

    final lapiz = Paint()..shader = gradiente.createShader(rect);

    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path = new Path();
    
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.3, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class IconHeader extends StatelessWidget {
  final Color color1;
  final Color color2;
  final IconData icon;
  final String subtitulo;
  final String titulo;

  IconHeader({
    this.color1: Colors.grey, 
    this.color2: Colors.blueGrey, 
    required this.icon, 
    required this.subtitulo, 
    required this.titulo
  });

  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity( 0.7 );
    
    return Stack(
      children: [
        _IconHeaderBackground(
          color1: this.color1,
          color2: this.color2
        ),

        Positioned(
          child: FaIcon(
            this.icon,
            color: Colors.white.withOpacity( 0.2 ),
            size: 250
          ),
          left: -70,
          top: -50
        ),

        Column(
          children: [
            SizedBox( height: 80, width: double.infinity ),

            Text(
              this.subtitulo,
              style: TextStyle( color: colorBlanco, fontSize: 20 ),
            ),

            SizedBox( height: 20 ),
          
            Text(
              this.titulo,
              style: TextStyle( color: colorBlanco, fontSize: 25, fontWeight: FontWeight.bold ),
            ),

            SizedBox( height: 20 ),

            FaIcon( this.icon, color: Colors.white, size: 80 ),
          ],
        )
      ]
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;

  _IconHeaderBackground({
    required this.color1,
    required this.color2
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular( 80 ) ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: <Color> [
            this.color1,
            this.color2
          ],
          end: Alignment.bottomCenter
        )
      ),
      height: 300,
      width: double.infinity
    );
  }
}
