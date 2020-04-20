import 'package:custom_pinter/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';
class LayautModel with ChangeNotifier{
  Widget _currentPage = SlideShowPage();

  set currentPage(Widget page){
    this._currentPage= page;
    notifyListeners();
  }
  Widget get currentPage =>this._currentPage;

}