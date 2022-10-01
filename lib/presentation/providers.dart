import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabinpris/presentation/components/user_shared_preference.dart';
import 'package:sabinpris/presentation/controller/exp_statistics_controller.dart';
import 'package:sabinpris/presentation/controller/fee_statistics_controller.dart';
import 'package:sabinpris/presentation/controller/student_search_controller.dart';

final themeModeProvider = ChangeNotifierProvider<LightMode>((ref) {
  return LightMode();
});

final studentSearchProvider =
    ChangeNotifierProvider<StudentSearch>((ref) => StudentSearch());
final feeStatsProvider =
    ChangeNotifierProvider<FeeStatistics>((ref) => FeeStatistics());
final expStatsProvider =
    ChangeNotifierProvider<ExpStatistics>((ref) => ExpStatistics());
