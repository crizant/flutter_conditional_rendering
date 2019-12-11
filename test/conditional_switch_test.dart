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
        ConditionalSwitch.single(
          valueBuilder: () => 'A',
          caseBuilders: {'A': () => aConditionWidget},
          fallbackBuilder: () => fallbackWidget,
        ),
      );

      expect(find.byWidget(aConditionWidget), findsOneWidget);
      expect(find.byWidget(fallbackWidget), findsNothing);
    },
  );

  testWidgets(
    'Render widget by `fallbackBuilder` if `valueBuilder` returns "B"',
    (WidgetTester tester) async {
      final Widget aConditionWidget = Container();
      final Widget fallbackWidget = Container();
      await tester.pumpWidget(
        ConditionalSwitch.single(
          valueBuilder: () => 'B',
          caseBuilders: {'A': () => aConditionWidget},
          fallbackBuilder: () => fallbackWidget,
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
        Column(
          children: ConditionalSwitch.list(
            valueBuilder: () => 'A',
            caseBuilders: {'A': () => aConditionWidgetList},
            fallbackBuilder: () => fallbackWidgetList,
          ),
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
    'Render list of widgets by `fallbackBuilder` if `valueBuilder` returns "B"',
    (WidgetTester tester) async {
      final List<Widget> aConditionWidgetList = [Container()];
      final List<Widget> fallbackWidgetList = [Container()];
      await tester.pumpWidget(
        Column(
          children: ConditionalSwitch.list(
            valueBuilder: () => 'B',
            caseBuilders: {'A': () => aConditionWidgetList},
            fallbackBuilder: () => fallbackWidgetList,
          ),
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
