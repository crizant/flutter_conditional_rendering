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
    required BuildContext context,
    required bool Function(BuildContext context) conditionBuilder,
    required Widget Function(BuildContext context) widgetBuilder,
    required Widget Function(BuildContext context) fallbackBuilder,
  }) {
    if (conditionBuilder(context) == true) {
      return widgetBuilder(context);
    } else {
      return fallbackBuilder(context);
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
    required BuildContext context,
    required bool Function(BuildContext context) conditionBuilder,
    required List<Widget> Function(BuildContext context) widgetBuilder,
    required List<Widget> Function(BuildContext context) fallbackBuilder,
  }) {
    if (conditionBuilder(context) == true) {
      return widgetBuilder(context);
    } else {
      return fallbackBuilder(context);
    }
  }
}
