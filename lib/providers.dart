import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabinpris/components/user_shared_preference.dart';

final themeModeProvider = ChangeNotifierProvider<LightMode>((ref) {
  return LightMode();
});
