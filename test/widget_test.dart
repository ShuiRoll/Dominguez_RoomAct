import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dominguez_navigation_app/calculator_screen.dart';

void main() {
  testWidgets('calculator performs operations and validates input',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: CalculatorScreen()),
    );

    await tester.enterText(find.byKey(const Key('first_number_input')), '10');
    await tester.enterText(find.byKey(const Key('second_number_input')), '2');

    await tester.tap(find.byKey(const Key('add_button')));
    await tester.pump();
    expect(find.text('12.0'), findsOneWidget);

    await tester.tap(find.byKey(const Key('subtract_button')));
    await tester.pump();
    expect(find.text('8.0'), findsOneWidget);

    await tester.tap(find.byKey(const Key('multiply_button')));
    await tester.pump();
    expect(find.text('20.0'), findsOneWidget);

    await tester.tap(find.byKey(const Key('divide_button')));
    await tester.pump();
    expect(find.text('5.0'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('second_number_input')), '0');
    await tester.tap(find.byKey(const Key('divide_button')));
    await tester.pump();
    expect(find.text('Cannot divide by zero'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('first_number_input')), '');
    await tester.tap(find.byKey(const Key('add_button')));
    await tester.pump();
    expect(find.text('Please enter both numbers'), findsOneWidget);

    await tester.ensureVisible(find.byKey(const Key('clear_button')));
    await tester.tap(find.byKey(const Key('clear_button')));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);
  });
}
