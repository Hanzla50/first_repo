
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kids/app/app.dart';
void main(){
  testWidgets("Hello Buddy test", (WidgetTester tester) async{
    await tester.pumpWidget(const myapp());
    expect(find.byType(Container), findsOneWidget);
    expect(find.text("Hello Buddy"), findsOneWidget);
  });
}