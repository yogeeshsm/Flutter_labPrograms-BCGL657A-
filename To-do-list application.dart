import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: TodoApp()));
class TodoApp extends StatefulWidget {
  @override
  State<TodoApp> createState() => _TodoAppState();
}
class _TodoAppState extends State<TodoApp> {
  List<String> tasks = [];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('To-Do')),
    body: Column(children: [
      TextField(
        onSubmitted: (text) {
          if (text.isNotEmpty) setState(() => tasks.add(text));
        },
        decoration: InputDecoration(hintText: 'Add task'),
      ),
      Expanded(
        child: ListView(
          children: tasks.asMap().entries.map((e) => ListTile(
            title: Text(e.value),
            onLongPress: () => setState(() => tasks.removeAt(e.key)),
          )).toList(),
        ),
      ),
    ]),
  );
}