final class OpenMeteoException implements Exception {
  const OpenMeteoException({required this.code, required this.reason});

  final int code;
  final String reason;
}
