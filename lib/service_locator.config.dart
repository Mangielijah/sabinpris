// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sabinpris/data/datasource/std_record_datasource.dart' as _i3;
import 'package:sabinpris/data/repositories/student_record_repository_impl.dart'
    as _i5;
import 'package:sabinpris/domain/repositories/student_record_repository.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.StudentRecordDataSource>(_i3.StudentRecordDataSource());
  gh.lazySingleton<_i4.StudentRecordRepository>(() =>
      _i5.StudentRecordRepositoryImpl(get<_i3.StudentRecordDataSource>()));
  return get;
}
