import 'package:flutter_conditional_rendering/lambda_conditional_switch.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets(
    'Render widget by case "A" builder if value is "A"',
    (WidgetTester tester) async {
      const value = 'A';

      final Widget aConditionWidget = Container();
      final Widget fallbackWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return LambdaConditionalSwitch.single(
              context: context,
              caseBuilders: {() => value == 'A': (_) => aConditionWidget},
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
    'Render widget by case "B" builder if value is "B"',
    (WidgetTester tester) async {
      const value = 'B';

      final Widget aConditionWidget = Container();
      final Widget bConditionWidget = Container();
      final Widget fallbackWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return LambdaConditionalSwitch.single(
              context: context,
              caseBuilders: {
                () => value == 'A': (_) => aConditionWidget,
                () => value == 'B': (_) => bConditionWidget,
              },
              fallbackBuilder: (_) => fallbackWidget,
            );
          },
        ),
      );

      expect(find.byWidget(aConditionWidget), findsNothing);
      expect(find.byWidget(bConditionWidget), findsOneWidget);
      expect(find.byWidget(fallbackWidget), findsNothing);
    },
  );

  testWidgets(
    'Render widget by `fallbackBuilder` if value is not "A"',
    (WidgetTester tester) async {
      const value = 'Z';

      final Widget aConditionWidget = Container();
      final Widget fallbackWidget = Container();
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return LambdaConditionalSwitch.single(
              context: context,
              caseBuilders: {() => value == 'A': (_) => aConditionWidget},
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
    'Render list of widgets by case "A" builder if value is "A"',
    (WidgetTester tester) async {
      const value = 'A';

      final List<Widget> aConditionWidgetList = [Container()];
      final List<Widget> fallbackWidgetList = [Container()];
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return Column(
              children: LambdaConditionalSwitch.list(
                context: context,
                caseBuilders: {() => value == 'A': (_) => aConditionWidgetList},
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
    'Render list of widgets by `fallbackBuilder` if value is not `A`',
    (WidgetTester tester) async {
      const value = 'Z';

      final List<Widget> aConditionWidgetList = [Container()];
      final List<Widget> fallbackWidgetList = [Container()];
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            return Column(
              children: LambdaConditionalSwitch.list(
                context: context,
                caseBuilders: {() => value == 'A': (_) => aConditionWidgetList},
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
