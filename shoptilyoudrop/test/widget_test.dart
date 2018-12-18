// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:shoptilyoudrop/main.dart';
import 'package:shoptilyoudrop/utils/service_locator.dart';

void main() {
  testWidgets('Test ServiceLocator', (WidgetTester tester) async {
    ServiceLocator.register<ITestClass>(new TestClass());

    var counter = ServiceLocator.resolve<ITestClass>();
    var sum = counter.add(1, 2);

    expect(3, sum);
  });
}

abstract class ITestClass{
  int add(int first, int second);
}

class TestClass extends ITestClass{
  @override
  int add(int first, int second) {
    return first + second;
  }

}
