import 'package:flutter/material.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/9_OPENAI/models/open_ai_model.dart';

class ResultScreen extends StatelessWidget {
  final GptData gptResponseData;
  const ResultScreen({super.key, required this.gptResponseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendation'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Recommendation',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            gptResponseData.choices[0].text,
            textAlign: TextAlign.justify,
          ),
        ),
      ]),
    );
  }
}
