import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
const String _THEME_MODE = 'THEME_MODE';

class LightMode extends ChangeNotifier {
  bool _isLightMode = true;
  SharedPreferences? _prefrences;
  LightMode() {
    //init mode
    _init();
  }

  bool get currentMode => _isLightMode;

  void _init() async {
    _prefrences ??= await SharedPreferences.getInstance();
    final mode = _prefrences?.getBool(_THEME_MODE) ?? true;
    _isLightMode = mode;
    notifyListeners();
  }

  void toggleMode() async {
    final mode =
        await _prefrences?.setBool(_THEME_MODE, !currentMode) ?? !currentMode;
    _isLightMode = mode;
    notifyListeners();
  }
}
