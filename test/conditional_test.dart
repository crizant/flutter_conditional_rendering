import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

void main() {
  testWidgets(
    'Render widget by `widgetBuilder` if `conditionBuilder` returns `true`',
    (WidgetTester tester) async {
      final Widget trueWidget = Container();
      final Widget falseWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return Conditional.single(
              context: context,
              conditionBuilder: (_) => true,
              widgetBuilder: (_) => trueWidget,
              fallbackBuilder: (_) => falseWidget,
            );
          },
        ),
      );

      expect(find.byWidget(trueWidget), findsOneWidget);
      expect(find.byWidget(falseWidget), findsNothing);
    },
  );

  testWidgets(
    'Render widget by `fallbackBuilder` if `conditionBuilder` returns `false`',
    (WidgetTester tester) async {
      final Widget trueWidget = Container();
      final Widget falseWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return Conditional.single(
              context: context,
              conditionBuilder: (_) => false,
              widgetBuilder: (_) => trueWidget,
              fallbackBuilder: (_) => falseWidget,
            );
          },
        ),
      );

      expect(find.byWidget(falseWidget), findsOneWidget);
      expect(find.byWidget(trueWidget), findsNothing);
    },
  );

  testWidgets(
    'Render list of widgets by `widgetBuilder` if ' +
        '`conditionBuilder` returns `true`',
    (WidgetTester tester) async {
      final List<Widget> trueWidgetList = [Container()];
      final List<Widget> falseWidgetList = [Container()];
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return Column(
              children: Conditional.list(
                context: context,
                conditionBuilder: (_) => true,
                widgetBuilder: (_) => trueWidgetList,
                fallbackBuilder: (_) => falseWidgetList,
              ),
            );
          },
        ),
      );

      for (Widget widget in trueWidgetList) {
        expect(find.byWidget(widget), findsOneWidget);
      }

      for (Widget widget in falseWidgetList) {
        expect(find.byWidget(widget), findsNothing);
      }
    },
  );

  testWidgets(
    'Render list of widgets by `widgetBuilder` if ' +
        '`conditionBuilder` returns `false`',
    (WidgetTester tester) async {
      final List<Widget> trueWidgetList = [Container()];
      final List<Widget> falseWidgetList = [Container()];
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return Column(
              children: Conditional.list(
                context: context,
                conditionBuilder: (_) => false,
                widgetBuilder: (_) => trueWidgetList,
                fallbackBuilder: (_) => falseWidgetList,
              ),
            );
          },
        ),
      );

      for (Widget widget in falseWidgetList) {
        expect(find.byWidget(widget), findsOneWidget);
      }

      for (Widget widget in trueWidgetList) {
        expect(find.byWidget(widget), findsNothing);
      }
    },
  );
}
