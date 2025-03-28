import 'dart:developer' as developer;

class Logger {
  static void log(
    String message, {
    int? sequenceNumber,
    int level = 0,
    Object? error,
    StackTrace? stackTrace,
  }) {
    developer.log(
      message,
      sequenceNumber: sequenceNumber,
      level: level,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
