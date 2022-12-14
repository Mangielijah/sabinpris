import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sabinpris/service_locator.config.dart';

final serviceLocator = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: false, // default
  // asExtension: false, // default
)
void setupDependencies() => $initGetIt(serviceLocator);
