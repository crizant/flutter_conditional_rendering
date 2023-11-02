# flutter_conditional_rendering

A flutter package which enhances conditional rendering, supports `if`-`else` and `switch` conditions.

## Why

In flutter if you want to do conditional rendering, you may do this:

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (someCondition == true)
          Text('The condition is true!'),
      ],
    );
  }
}
```

But what if you want to use a tertiary (`if`-`else`) condition?

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        someCondition == true ?
          Text('The condition is true!'):
          Text('The condition is false!'),
      ],
    );
  }
}
```

It is okay for a single `Text` widget, but the readability quickly become very bad when the child widget is multi-layered.

## Usage

### If-Else condition:

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Conditional.single(
          context: context,
          conditionBuilder: (BuildContext context) => someCondition == true,
          widgetBuilder: (BuildContext context) => Text('The condition is true!'),
          fallbackBuilder: (BuildContext context) => Text('The condition is false!'),
        ),
      ],
    );
  }
}
```

### Switch condition:

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ConditionalSwitch.single<String>(
          context: context,
          valueBuilder: (BuildContext context) => 'A',
          caseBuilders: {
            'A': (BuildContext context) => Text('The value is A!'),
            'B': (BuildContext context) => Text('The value is B!'),
          },
          fallbackBuilder: (BuildContext context) => Text('None of the cases matched!'),
        ),
      ],
    );
  }
}
```

### Lambda switch condition:

Returns the first lambda which matches (returns true).

Lambdas are evaluated in order therefore it would make sense to order them so the most likely matched conditions are placed first
and the least likely last.


```dart
class MyWidget extends StatelessWidget {
  var counter = 8;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LambdaConditionalSwitch.single(
          context: context,
          caseBuilders: {
                () => counter == 0: (BuildContext context) =>
            const Text('Counter is 0!'),
                () => counter > 0 && counter % 5 == 0: (BuildContext context) =>
            const Text('Counter is divisible by 5!'),
                () => counter == 8: (BuildContext context) =>
            const Text('Counter is 8!'),
          },
          fallbackBuilder: (BuildContext context) =>
          const Text('None of the cases matched!'),
        ),
      ],
    );
  }
}
```

## Want a list of widgets?

If you want to conditionally render a list of widgets (`List<Widget>`) instead of a single one. Use `Conditional.list()` and `ConditionalSwitch.list()`!

## Contributions

Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](https://github.com/crizant/flutter_conditional_rendering/issues).
If you fixed a bug or implemented a feature, please send a [pull request](https://github.com/crizant/flutter_conditional_rendering/pulls).
