/*
 Created by Thanh Son on 11/08/2023.
 Copyright (c) 2023 . All rights reserved.
*/



import 'dart:async';
import 'dart:developer' as developer;

/// Flint uses [OBLog] to log into the logger.
mixin OBLog {
  /// log [message] into logger with [name] is optional.
  FutureOr<void> log(String message, {String? name});

  /// log error into logger with [name] is optional.
  FutureOr<void> error({
    dynamic error,
    StackTrace? stackTrace,
    String? name,
    String? message,
  });
}

/// An instance of [OBLog], only use inside of Flint Project;
// ignore: non_constant_identifier_names
final OBLogs = _OBLogFactory();

class _OBLogFactory {
  OBLog logger = DefaultLog();

  FutureOr<void> error(
      {error, StackTrace? stackTrace, String? name, String? message}) {
    try {
      logger.error(
          error: error, stackTrace: stackTrace, name: name, message: message);
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> log(String message, {String? name}) {
    try {
      logger.log(message, name: name);
    } catch (e) {
      print(e);
    }
  }
}

/// Default [OBLog] will be written to the developer.log
/// In default, the optional field [name] is replaced by [logName] if it is null
class DefaultLog implements OBLog {
  /// Default of log's name
  final String logName = 'OBLog';

  @override
  Future<void> error(
      {error, StackTrace? stackTrace, String? name, String? message}) async {
    developer.log(
      message ?? '',
      name: name ?? logName,
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  Future<void> log(String message, {String? name}) async {
    developer.log(message, name: name ?? logName);
  }
}
