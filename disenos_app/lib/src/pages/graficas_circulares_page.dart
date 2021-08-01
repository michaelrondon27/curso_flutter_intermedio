import 'package:flutter/material.dart';

import 'package:disenos_app/src/widgets/radial_progress.dart';

class GraficasCircularesPAge extends StatefulWidget {
  @override
  _GraficasCircularesPAgeState createState() => _GraficasCircularesPAgeState();
}

class _GraficasCircularesPAgeState extends State<GraficasCircularesPAge> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: RadialProgress( porcentaje: 40.0 ),
          color: Colors.red,
          height: 300,
          width: 300,
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.refresh ),
        onPressed: () {
          setState(() {
            porcentaje += 10;

            if ( porcentaje > 100 ) {
              porcentaje = 0;
            }
          });
        }
      ),
    );
  }
}
