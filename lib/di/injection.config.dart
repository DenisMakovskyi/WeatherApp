// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:weather_app/application/services/measurement_system_resolver.dart'
    as _i88;
import 'package:weather_app/data/data_sources/local/weather_local_data_source.dart'
    as _i434;
import 'package:weather_app/data/data_sources/platform/location_data_source.dart'
    as _i328;
import 'package:weather_app/data/data_sources/remote/weather_remote_data_source.dart'
    as _i95;
import 'package:weather_app/data/repositories/location_repository_impl.dart'
    as _i510;
import 'package:weather_app/data/repositories/weather_repository_impl.dart'
    as _i823;
import 'package:weather_app/di/modules/app_module.dart' as _i191;
import 'package:weather_app/domain/repositories/location_repository.dart'
    as _i245;
import 'package:weather_app/domain/repositories/weather_repository.dart'
    as _i970;
import 'package:weather_app/domain/use_cases/weather_use_case.dart' as _i538;
import 'package:weather_app/presentation/bloc/weather_bloc.dart' as _i617;
import 'package:weather_app/presentation/mappers/weather_ui_mapper.dart'
    as _i334;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i434.WeatherLocalDataSource>(
      () => const _i434.WeatherLocalDataSource(),
    );
    gh.lazySingleton<_i328.LocationDataSource>(
      () => const _i328.LocationDataSource(),
    );
    gh.lazySingleton<_i519.Client>(() => appModule.client);
    gh.lazySingleton<_i88.MeasurementSystemResolver>(
      () => appModule.measurementSystemResolver,
    );
    gh.lazySingleton<_i334.WeatherUiMapper>(() => appModule.weatherUiMapper);
    gh.lazySingleton<_i95.WeatherRemoteDataSource>(
      () => _i95.WeatherRemoteDataSource(gh<_i519.Client>()),
    );
    gh.lazySingleton<_i245.LocationRepository>(
      () => _i510.LocationRepositoryImpl(gh<_i328.LocationDataSource>()),
    );
    gh.lazySingleton<_i970.WeatherRepository>(
      () => _i823.WeatherRepositoryImpl(
        gh<_i434.WeatherLocalDataSource>(),
        gh<_i95.WeatherRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i538.WeatherUseCase>(
      () => appModule.weatherUseCase(
        gh<_i245.LocationRepository>(),
        gh<_i970.WeatherRepository>(),
      ),
    );
    gh.factory<_i617.WeatherBloc>(
      () => _i617.WeatherBloc(
        gh<_i88.MeasurementSystemResolver>(),
        gh<_i538.WeatherUseCase>(),
        gh<_i245.LocationRepository>(),
        gh<_i334.WeatherUiMapper>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i191.AppModule {}
