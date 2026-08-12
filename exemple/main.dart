import 'package:flutter/material.dart';
import 'package:custom_feedback/custom_feedback.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            CustomFeedback.dialog(
              context: context,
              title: const Center(child: Text("TESTE")),
              closeTime: Duration(seconds: 3)
            );
            CustomFeedback.snackBar(context: context);
          },
          child: const Text("Check Dialog")
        )
      )
    );
  }
}
