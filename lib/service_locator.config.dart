// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sabinpris/data/datasource/expenditure_datasource.dart' as _i3;
import 'package:sabinpris/data/datasource/std_record_datasource.dart' as _i4;
import 'package:sabinpris/data/repositories/expenditure_repository_impl.dart'
    as _i8;
import 'package:sabinpris/data/repositories/student_record_repository_impl.dart'
    as _i6;
import 'package:sabinpris/domain/repositories/expenditure_repository.dart'
    as _i7;
import 'package:sabinpris/domain/repositories/student_record_repository.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i3.ExpenditureDataSource>(_i3.ExpenditureDataSource());
  gh.singleton<_i4.StudentRecordDataSource>(_i4.StudentRecordDataSource());
  gh.singleton<_i5.StudentRecordRepository>(
      _i6.StudentRecordRepositoryImpl(get<_i4.StudentRecordDataSource>()));
  gh.singleton<_i7.ExpenditureRepository>(_i8.ExpenditureRepositoryImpl(
    get<_i3.ExpenditureDataSource>(),
    get<_i4.StudentRecordDataSource>(),
  ));
  return get;
}
