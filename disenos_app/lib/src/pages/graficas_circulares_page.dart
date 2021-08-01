import 'package:flutter/material.dart';

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
        child: Text('$porcentaje %')
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
