import 'package:flutter/widgets.dart';

import 'package:weather_app/app/app.dart';
import 'package:weather_app/di/injection.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
  final weatherBloc = getIt<WeatherBloc>();

  runApp(WeatherApp(deviceLocale: deviceLocale, weatherBloc: weatherBloc));
}
