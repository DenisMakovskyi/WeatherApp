Map<String, dynamic> readMap(Map<String, dynamic> json, String key) {
  final value = json[key];

  if (value is Map<String, dynamic>) {
    return value;
  }

  throw FormatException('Expected object for "$key".');
}

int readInt(Map<String, dynamic> json, String key) {
  final value = json[key];

  if (value is int) {
    return value;
  }

  if (value is num) {
    return value.toInt();
  }

  throw FormatException('Expected integer for "$key".');
}

double readDouble(Map<String, dynamic> json, String key) {
  final value = json[key];

  if (value is num) {
    return value.toDouble();
  }

  throw FormatException('Expected number for "$key".');
}

String readString(Map<String, dynamic> json, String key) {
  final value = json[key];

  if (value is String) {
    return value;
  }

  throw FormatException('Expected string for "$key".');
}
