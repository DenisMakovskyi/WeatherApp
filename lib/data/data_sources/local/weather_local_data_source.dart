import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import 'package:weather_app/data/proto/generated/weather_entity.pb.dart';

@lazySingleton
final class WeatherLocalDataSource {
  const WeatherLocalDataSource();

  static const _fileName = 'weather_entity.pb';

  Future<WeatherEntity?> read() async {
    final file = await _resolveFile();

    if (!await file.exists()) {
      return null;
    }

    final bytes = await file.readAsBytes();

    if (bytes.isEmpty) {
      return null;
    }

    return WeatherEntity.fromBuffer(bytes);
  }

  Future<void> write(WeatherEntity entity) async {
    final file = await _resolveFile();
    final temporaryFile = File('${file.path}.tmp');

    await temporaryFile.writeAsBytes(entity.writeToBuffer(), flush: true);

    await temporaryFile.rename(file.path);
  }

  Future<File> _resolveFile() async {
    final directory = await getApplicationSupportDirectory();

    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    return File('${directory.path}/$_fileName');
  }
}
