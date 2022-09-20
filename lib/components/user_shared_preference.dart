import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

// class UserSimplePreferences {
//   static SharedPreferences? _prefrences;

//   static const _darkMode = 'darkmodeTheme';

//   static Future init() async {
//     if (_prefrences != null) {
//       _prefrences = await SharedPreferences.getInstance();
//     }
//   }

//   static Future<Future<bool>?> setDarkMode(bool theme) async =>
//       _prefrences?.setBool(_darkMode, theme);

//   static bool? getDarkMode() => _prefrences?.getBool(_darkMode);

//   static ValueNotifier<bool> isSwitchedDarkMode =
//       ValueNotifier(UserSimplePreferences.getDarkMode()!);
// }

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
