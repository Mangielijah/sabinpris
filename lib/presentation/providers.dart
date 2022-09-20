import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabinpris/presentation/components/user_shared_preference.dart';

final themeModeProvider = ChangeNotifierProvider<LightMode>((ref) {
  return LightMode();
});
