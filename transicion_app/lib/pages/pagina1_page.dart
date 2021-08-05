import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pagina 1'),
      ),
      body: Center(
        child: Text('Pagina 1')
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.access_time ),
        onPressed: () {},
      ),
    );
  }
}