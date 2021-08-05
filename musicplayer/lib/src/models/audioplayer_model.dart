import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  late AnimationController _controller;
  bool _playing = false;

  AnimationController get controller => this._controller;

  set controller( AnimationController value ) {
    this._controller = value;
  }
}
