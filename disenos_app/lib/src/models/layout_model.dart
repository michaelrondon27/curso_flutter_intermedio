import 'package:flutter/material.dart';

import 'package:disenos_app/src/pages/slideshow_page.dart';

class LayoutModel with ChangeNotifier {
  Widget _currantPage = SlideshowPage();

  Widget get currentPage => this._currantPage;

  set currentPage( Widget value ) {
    this._currantPage = value;

    notifyListeners();
  }
}
