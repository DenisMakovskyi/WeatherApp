import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:weather_app/application/services/measurement_system_resolver.dart';
import 'package:weather_app/domain/entities/measurement_system.dart';
import 'package:weather_app/domain/failures/app_failure.dart';
import 'package:weather_app/domain/failures/weather_failure.dart';
import 'package:weather_app/domain/repositories/location_repository.dart';
import 'package:weather_app/domain/result.dart';
import 'package:weather_app/domain/use_cases/weather_use_case.dart';
import 'package:weather_app/presentation/mappers/weather_ui_mapper.dart';
import 'package:weather_app/presentation/models/weather_ui_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

@injectable
final class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(
    this._measurementSystemResolver,
    this._weatherUseCase,
    this._locationRepository,
    this._weatherUiMapper,
  ) : super(const WeatherState.initial()) {
    on<WeatherLoadRequested>(_onLoadRequested, transformer: restartable());
    on<WeatherAppSettingsRequested>(
      _onAppSettingsRequested,
      transformer: droppable(),
    );
    on<WeatherLocationSettingsRequested>(
      _onLocationSettingsRequested,
      transformer: droppable(),
    );
  }

  final MeasurementSystemResolver _measurementSystemResolver;
  final WeatherUseCase _weatherUseCase;
  final LocationRepository _locationRepository;
  final WeatherUiMapper _weatherUiMapper;

  MeasurementSystem? _measurementSystem;

  Future<void> _onLoadRequested(
    WeatherLoadRequested event,
    Emitter<WeatherState> emit,
  ) async {
    final measurementSystem = switch (event) {
      WeatherStarted(:final locale) => _measurementSystemResolver.resolve(
        locale,
      ),
      WeatherRetryRequested() => _measurementSystem,
    };

    if (measurementSystem == null) {
      return;
    }

    _measurementSystem = measurementSystem;

    var visibleWeather = _visibleWeatherFor(measurementSystem);

    if (visibleWeather.hasData) {
      emit(WeatherState.refreshing(visibleWeather));
    } else {
      emit(WeatherState.loading(visibleWeather));
    }

    await emit.forEach<WeatherLoadUpdate>(
      _weatherUseCase(measurementSystem: measurementSystem),
      onData: (update) {
        switch (update) {
          case CachedWeatherLoaded(:final weather):
            visibleWeather = _weatherUiMapper.map(weather);

            return WeatherState.refreshing(visibleWeather);
          case CurrentWeatherLoaded(:final weather):
            visibleWeather = _weatherUiMapper.map(weather);

            return WeatherState.success(visibleWeather);
          case WeatherLoadFailed(:final failure):
            return WeatherState.failure(
              weather: visibleWeather,
              failure: failure,
            );
        }
      },
      onError: (error, stackTrace) {
        return WeatherState.failure(
          weather: visibleWeather,
          failure: const WeatherFailure(WeatherFailureReason.unknown),
        );
      },
    );
  }

  Future<void> _onAppSettingsRequested(
    WeatherAppSettingsRequested event,
    Emitter<WeatherState> emit,
  ) async {
    final result = await _locationRepository.openAppSettings();

    _emitSettingsFailure(result, emit);
  }

  Future<void> _onLocationSettingsRequested(
    WeatherLocationSettingsRequested event,
    Emitter<WeatherState> emit,
  ) async {
    final result = await _locationRepository.openLocationSettings();

    _emitSettingsFailure(result, emit);
  }

  WeatherUiModel _visibleWeatherFor(MeasurementSystem measurementSystem) {
    if (state.weather.measurementSystem == measurementSystem) {
      return state.weather;
    }

    return WeatherUiModel.placeholder(measurementSystem: measurementSystem);
  }

  void _emitSettingsFailure(Result<bool> result, Emitter<WeatherState> emit) {
    if (result case Failure(:final failure)) {
      emit(WeatherState.failure(weather: state.weather, failure: failure));
    }
  }
}
