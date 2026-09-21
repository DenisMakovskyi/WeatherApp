import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/presentation/bloc/weather_bloc.dart';

final class WeatherApp extends StatelessWidget {
  const WeatherApp({
    required Locale deviceLocale,
    required WeatherBloc weatherBloc,
    super.key,
  }) : _deviceLocale = deviceLocale,
       _weatherBloc = weatherBloc;

  final Locale _deviceLocale;
  final WeatherBloc _weatherBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _weatherBloc..add(WeatherStarted(_deviceLocale)),
      child: const MaterialApp(
        title: 'WeatherApp',
        locale: Locale('en'),
        home: SizedBox.shrink(),
        supportedLocales: [Locale('en')],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
