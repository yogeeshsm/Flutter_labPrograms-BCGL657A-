mport 'package:flutter/material.dart';
void main() => runApp(const MaterialApp(home: Quiz()));
class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}
class _QuizState extends State<Quiz> {
  String result = '';
  @override
  
  Widget build(BuildContext context) {
    if (result.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Result')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(result, style: const TextStyle(fontSize: 28)),
              ElevatedButton(
                onPressed: () => setState(() => result = ''),
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('What is the capital of France?', style: TextStyle(fontSize: 22)),
            ElevatedButton(
              onPressed: () => setState(() => result = 'Wrong!'),
              child: const Text('London'),
            ),
            ElevatedButton(
              onPressed: () => setState(() => result = 'Wrong!'),
              child: const Text('Rome'),
            ),
            ElevatedButton(
              onPressed: () => setState(() => result = 'Correct!'),
              child: const Text('Paris'),
            ),
            ElevatedButton(
              onPressed: () => setState(() => result = 'Wrong!'),
              child: const Text('Berlin'),
            ),
          ],
        ),
      ),
    );
  }
}
