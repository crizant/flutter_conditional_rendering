import 'package:flutter/material.dart';

/// Conditional rendering switch class
class ConditionalSwitch {
  ConditionalSwitch._();

  /// A function which returns a single `Widget`
  ///
  /// - [valueBuilder] is a function which returns a value.
  /// - [caseBuilders] is a `Map` of value to `Widget` builders,
  /// when one of the keys matches the value returns by [valueBuilder],
  /// the corresponding `Widget` builder will be used.
  /// - [fallbackBuilder] is a function which returns a `Widget`,
  ///  it is used when none of the keys in [caseBuilders]matches
  /// the value returns by [valueBuilder]. If [fallbackBuilder] is
  /// not provided, a `Container()` will be returned.
  static Widget single<T>({
    required BuildContext context,
    required T Function(BuildContext context) valueBuilder,
    required Map<T, Widget Function(BuildContext context)> caseBuilders,
    Widget Function(BuildContext context)? fallbackBuilder,
  }) {
    final T value = valueBuilder(context);
    if (caseBuilders[value] != null) {
      return caseBuilders[value]!(context);
    } else {
      return fallbackBuilder?.call(context) ?? Container();
    }
  }

  /// A function which returns a `List<Widget>`
  ///
  /// - [valueBuilder] is a function which returns a value.
  /// - [caseBuilders] is a `Map` of value to `List<Widget>` builders,
  /// when one of the keys matches the value returns by [valueBuilder],
  /// the corresponding `List<Widget>` builder will be used.
  /// - [fallbackBuilder] is a function which returns a `List<Widget>`,
  ///  it is used when none of the keys in [caseBuilders] matches
  /// the value returns by [valueBuilder]. If [fallbackBuilder] is
  /// not provided, an empty list will be returned.
  static List<Widget> list<T>({
    required BuildContext context,
    required T Function(BuildContext context) valueBuilder,
    required Map<T, List<Widget> Function(BuildContext context)> caseBuilders,
    List<Widget> Function(BuildContext context)? fallbackBuilder,
  }) {
    final T value = valueBuilder(context);
    if (caseBuilders[value] != null) {
      return caseBuilders[value]!(context);
    } else {
      return fallbackBuilder?.call(context) ?? [];
    }
  }
}
