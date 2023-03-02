import 'package:flutter/cupertino.dart';
import 'package:six_exam/service/theme_service.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isLight = StorageService.getBool("isLight");

  setIsLight(bool isLight) async {
    _isLight = isLight;
    await StorageService.saveBool("isLight", _isLight);
    notifyListeners();
  }

  getIsLight() {
    return _isLight;
  }
}