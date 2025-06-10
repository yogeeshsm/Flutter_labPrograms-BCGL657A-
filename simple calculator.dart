import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Calculator()));

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double num1 = 0, num2 = 0, result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Calculator')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "First number"),
              keyboardType: TextInputType.number,
              onChanged: (val) => num1 = double.tryParse(val) ?? 0,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Second number"),
              keyboardType: TextInputType.number,
              onChanged: (val) => num2 = double.tryParse(val) ?? 0,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => setState(() => result = num1 + num2), child: Text('+')),
                ElevatedButton(onPressed: () => setState(() => result = num1 - num2), child: Text('-')),
                ElevatedButton(onPressed: () => setState(() => result = num1 * num2), child: Text('×')),
                ElevatedButton(onPressed: () => setState(() => result = num2 != 0 ? num1 / num2 : 0), child: Text('÷')),
              ],
            ),
            SizedBox(height: 20),
            Text('Result: $result', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
