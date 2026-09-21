# WeatherApp

WeatherApp is a Flutter application for Android and iOS that loads current
weather for the device's precise location from Open-Meteo.

## Architecture

- `application` resolves application-level policies such as the measurement
  system for the device locale.
- `data` owns location and Open-Meteo integrations, DTOs, protobuf persistence,
  mappers, and repository implementations.
- `domain` contains models, failures, repository contracts, and the weather use
  case.
- `presentation` contains the Bloc contract, state transitions, and UI models.
- `di` configures GetIt through Injectable.

The refresh path is `remote response -> model -> WeatherEntity -> model`.
Only the model read back from protobuf is emitted as fresh weather, so the
protobuf entity remains the local source of truth.

The visual weather screen is intentionally not implemented until its design is
available. The current app shell starts `WeatherBloc` on launch and displays an
empty placeholder surface.

## Code generation

Generate Injectable registrations:

```sh
dart run build_runner build
```

Generate protobuf classes after changing `proto/weather_entity.proto`:

```sh
protoc --dart_out=lib/data/proto/generated -Iproto proto/weather_entity.proto
```
