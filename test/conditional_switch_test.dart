import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

void main() {
  testWidgets(
    'Render widget by case "A" builder if `valueBuilder` returns "A"',
    (WidgetTester tester) async {
      final Widget aConditionWidget = Container();
      final Widget fallbackWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return ConditionalSwitch.single<String>(
              context: context,
              valueBuilder: (_) => 'A',
              caseBuilders: {'A': (_) => aConditionWidget},
              fallbackBuilder: (_) => fallbackWidget,
            );
          },
        ),
      );

      expect(find.byWidget(aConditionWidget), findsOneWidget);
      expect(find.byWidget(fallbackWidget), findsNothing);
    },
  );

  testWidgets(
    'Render widget by `fallbackBuilder` if `valueBuilder` returns `0`',
    (WidgetTester tester) async {
      final Widget aConditionWidget = Container();
      final Widget fallbackWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return ConditionalSwitch.single<dynamic>(
              context: context,
              valueBuilder: (_) => 0,
              caseBuilders: {'A': (_) => aConditionWidget},
              fallbackBuilder: (_) => fallbackWidget,
            );
          },
        ),
      );

      expect(find.byWidget(fallbackWidget), findsOneWidget);
      expect(find.byWidget(aConditionWidget), findsNothing);
    },
  );

  testWidgets(
    'Render list of widgets by case "A" builder if `valueBuilder` returns "A"',
    (WidgetTester tester) async {
      final List<Widget> aConditionWidgetList = [Container()];
      final List<Widget> fallbackWidgetList = [Container()];
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return Column(
              children: ConditionalSwitch.list<String>(
                context: context,
                valueBuilder: (_) => 'A',
                caseBuilders: {'A': (_) => aConditionWidgetList},
                fallbackBuilder: (_) => fallbackWidgetList,
              ),
            );
          },
        ),
      );

      for (Widget widget in aConditionWidgetList) {
        expect(find.byWidget(widget), findsOneWidget);
      }

      for (Widget widget in fallbackWidgetList) {
        expect(find.byWidget(widget), findsNothing);
      }
    },
  );

  testWidgets(
    'Render list of widgets by `fallbackBuilder` if `valueBuilder` returns `0`',
    (WidgetTester tester) async {
      final List<Widget> aConditionWidgetList = [Container()];
      final List<Widget> fallbackWidgetList = [Container()];
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return Column(
              children: ConditionalSwitch.list<dynamic>(
                context: context,
                valueBuilder: (_) => 0,
                caseBuilders: {'A': (_) => aConditionWidgetList},
                fallbackBuilder: (_) => fallbackWidgetList,
              ),
            );
          },
        ),
      );

      for (Widget widget in fallbackWidgetList) {
        expect(find.byWidget(widget), findsOneWidget);
      }

      for (Widget widget in aConditionWidgetList) {
        expect(find.byWidget(widget), findsNothing);
      }
    },
  );
}
