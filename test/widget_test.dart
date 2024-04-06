import 'package:flutter/material.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/7_REST%20API%20JSON/dicebear_avatar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Judul Harus ...', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: DiceBearAPI(),
    ));
    expect(find.text("DiceBear Avatar Example"), findsOneWidget);
  });
  testWidgets('Judul Harus ...', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: DiceBearAPI(),
    ));
    expect(find.text("Get Random Avatar"), findsOneWidget);
  });
}
