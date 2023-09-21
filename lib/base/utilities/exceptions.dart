/*
 Created by Thanh Son on 11/08/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:meta/meta.dart';
import 'package:objectx/objectx.dart';

/// Exception for the Owlets project
///
/// Wrap [error] in an instance of [OwletBaseException].
/// The error's information can be traced to [stackTrace], [time], and custom [devDescription].
/// The error is identified by [errorCode]. For example, errorCode = 404 or errorCore = 'file-not-found'.
/// The [displayTitle], [displayMessage] can be used to display this error on UI as a human language.
abstract class OwletBaseException<T> implements Exception {
  /// Use for other Implement Exception, which extends on [OwletBaseException]
  ///
  /// Example:
  /// ```
  /// class OBException<T> extends OwletBaseException<T>
  ///     with _OBExceptionMixin<T> {
  ///   /// Create a new instance of OBException.
  ///   const OBException({
  ///     StackTrace? stackTrace,
  ///     T? error,
  ///     DateTime? time,
  ///     Object? errorCode,
  ///     Object? devDescription,
  ///     String? displayTitle,
  ///     String? displayMessage,
  ///   }) : super(
  ///           error: error,
  ///           stackTrace: stackTrace,
  ///           displayMessage: displayMessage,
  ///           displayTitle: displayTitle,
  ///           errorCode: errorCode,
  ///           devDescription: devDescription,
  ///           time: time,
  ///         );
  /// ```
  const OwletBaseException({
    this.stackTrace,
    this.error,
    this.time,
    this.errorCode,
    this.devDescription,
    this.displayTitle,
    this.displayMessage,
  });

  /// The error wrapped in [OBException]
  final T? error;

  /// Stack trace of the [error].
  final StackTrace? stackTrace;

  /// The time, when the [error] happens.
  final DateTime? time;

  /// A message title will be displayed on the UI as human language.
  final String? displayTitle;

  /// A message will be displayed on the UI as human language.
  final String? displayMessage;

  /// Error's identity code.
  final Object? errorCode;

  /// Dev's description for more information about this error.
  final Object? devDescription;

  /// When a OBException is wrapped in another [OBException],
  /// [originError] looks for deep in [error] (as [OBException]),
  /// and returns a [error] which is not an instance of [OBException].
  /// If [error] == null, the instance, which wraps this [error] will be returned,
  /// even when it is of [OBException].
  Object? originError();
}

/// Create a new instance of [OBException]
///
/// Example:
/// ```
/// final exception = OBException(); //exception is _OBExceptionMixin
/// ```
@protected
class OBException<T> extends OwletBaseException<T> with _OBExceptionMixin<T> {
  /// Create a new instance of [OBException].
  const OBException({
    StackTrace? stackTrace,
    T? error,
    DateTime? time,
    Object? errorCode,
    Object? devDescription,
    String? displayTitle,
    String? displayMessage,
  }) : super(
          error: error,
          stackTrace: stackTrace,
          displayMessage: displayMessage,
          displayTitle: displayTitle,
          errorCode: errorCode,
          devDescription: devDescription,
          time: time,
        );
}

/// Default _OBExceptionMixin's behavior.
///
/// The [OwletBaseException] is an abstract class,  all of its methods are not implemented.
/// [_OBExceptionMixin] will implement the [OwletBaseException]'s methods.
///
/// Example:
/// ```
/// class OBException<T> extends OwletBaseException<T>
///     with _OBExceptionMixin<T> {
///   /// Create a new instance of OBException.
///   const OBException({
///     StackTrace? stackTrace,
///     T? error,
///     DateTime? time,
///     Object? errorCode,
///     Object? devDescription,
///     String? displayTitle,
///     String? displayMessage,
///   }) : super(
///     error: error,
///     stackTrace: stackTrace,
///     displayMessage: displayMessage,
///     displayTitle: displayTitle,
///     errorCode: errorCode,
///     devDescription: devDescription,
///     time: time,
///   );
/// }
/// ```
mixin _OBExceptionMixin<T> on OwletBaseException<T> {
  String get _consoleString {
    final buffer = StringBuffer();
    buffer.write('$runtimeType(');
    errorCode?.let(buffer.write);
    if (errorCode != null && time != null) buffer.write(', ');
    time?.let(buffer.write);
    buffer.writeln(')');
    displayTitle?.let(buffer.writeln);
    displayMessage?.let((it) => buffer.writeln('- $it'));
    error?.let(buffer.writeln);
    stackTrace?.let(buffer.writeln);
    return buffer.toString().trim();
  }

  @override
  String toString() => _consoleString;

  @override
  Object? originError() => _findOrigin(this);

  Object? _findOrigin(OwletBaseException e) {
    if (e.error == null) return e;
    if (e.error is OwletBaseException) return _findOrigin(e);
    return e.error;
  }
}
