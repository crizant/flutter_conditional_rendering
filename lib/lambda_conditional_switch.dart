import 'package:flutter/material.dart';

/// Lambda conditional rendering switch class
class LambdaConditionalSwitch {
  LambdaConditionalSwitch._();

  /// A function which returns a single `Widget`
  ///
  /// - [caseBuilders] is a `Map` of lambda to `Widget` builders,
  /// when one of the lambdas returns true,
  /// the corresponding `Widget` builder will be used.
  /// - [fallbackBuilder] is a function which returns a `Widget`,
  ///  it is used when none of the lambdas in [caseBuilders] matches
  /// the value returns by [valueBuilder].
  static Widget single({
    required BuildContext context,
    required Map<bool Function(), Widget Function(BuildContext context)>
        caseBuilders,
    required Widget Function(BuildContext context) fallbackBuilder,
  }) {
    for (var lambda in caseBuilders.keys) {
      if (lambda.call()) {
        return caseBuilders[lambda]!(context);
      }
    }
    return fallbackBuilder(context);
  }

  /// A function which returns a `List<Widget>`
  ///
  /// - [caseBuilders] is a `Map` of lambda to `List<Widget>` builders,
  /// when one of the lambdas returns true,
  /// the corresponding `List<Widget>` builder will be used.
  /// - [fallbackBuilder] is a function which returns a `List<Widget>`,
  ///  it is used when none of the lambdas in [caseBuilders] matches
  /// the value returns by [valueBuilder].
  static List<Widget> list({
    required BuildContext context,
    required Map<bool Function(), List<Widget> Function(BuildContext context)>
        caseBuilders,
    required List<Widget> Function(BuildContext context) fallbackBuilder,
  }) {
    for (var lambda in caseBuilders.keys) {
      if (lambda.call()) {
        return caseBuilders[lambda]!(context);
      }
    }
    return fallbackBuilder(context);
  }
}
