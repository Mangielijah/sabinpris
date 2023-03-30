import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:sabinpris/data/models/expenditure_dto.dart';
import 'package:sabinpris/data/models/student_record_dto.dart';
import 'package:sabinpris/service_locator.config.dart';

final serviceLocator = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: false, // default
  // asExtension: false, // default
)
void setupDependencies() async {
  await Hive.initFlutter();
  Hive.registerAdapter(StudentRecordDtoAdapter());
  Hive.registerAdapter(ExpenditureDtoAdapter());
  $initGetIt(serviceLocator);
}
