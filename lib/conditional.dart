import 'package:flutter/material.dart';

/// Conditional rendering class
class Conditional {
  Conditional._();

  /// A function which returns a single `Widget`
  ///
  /// - [conditionBuilder] is a function which returns a boolean.
  /// - [widgetBuilder] is a function which returns a `Widget`,
  ///  when [conditionBuilder] returns `true`.
  /// - [fallbackBuilder] is a function which returns a `Widget`,
  ///  when [conditionBuilder] returns `false`.
  static Widget single({
    @required bool Function() conditionBuilder,
    @required Widget Function() widgetBuilder,
    @required Widget Function() fallbackBuilder,
  }) {
    if (conditionBuilder() == true) {
      return widgetBuilder();
    } else {
      return fallbackBuilder();
    }
  }

  /// A function which returns a `List<Widget>`
  ///
  /// - [conditionBuilder] is the function which returns a boolean.
  /// - [widgetBuilder] is a function which returns a `List<Widget>`,
  ///  when [conditionBuilder] returns `true`.
  /// - [fallbackBuilder] is a function which returns a `List<Widget>`,
  ///  when [conditionBuilder] returns `false`.
  static List<Widget> list({
    @required bool Function() conditionBuilder,
    @required List<Widget> Function() widgetBuilder,
    @required List<Widget> Function() fallbackBuilder,
  }) {
    if (conditionBuilder() == true) {
      return widgetBuilder();
    } else {
      return fallbackBuilder();
    }
  }
}
