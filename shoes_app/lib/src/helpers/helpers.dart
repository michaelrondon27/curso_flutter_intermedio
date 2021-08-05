import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;

void cambiarStatusLight() {
  services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

void cambiarStatusDark() {
  services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
}
