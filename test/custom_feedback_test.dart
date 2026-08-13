import 'package:custom_feedback/custom_feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Deve retornar o valor de onOpen', (tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Builder(
        builder: (context) {
          return ElevatedButton(
            onPressed: () async {
              final result = await CustomFeedback.dialog<bool>(
                context: context,
                title: const Text('Meu Dialog'),
                content: const Text('Conteúdo'),
                onOpen: () async {
                  return true;
                },
              );

              expect(result, false);
            },
            child: const Text('Abrir'),
          );
        },
      ),
    ),
  );

  await tester.tap(find.text('Abrir'));
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 100));
});
}