import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MaterialApp(home: StopwatchApp()));

class StopwatchApp extends StatefulWidget {
  @override
  State<StopwatchApp> createState() => _StopwatchAppState();
}

class _StopwatchAppState extends State<StopwatchApp> {
  Stopwatch s = Stopwatch();
  Timer? t;

  String get time => "${(s.elapsed.inMinutes).toString().padLeft(2, '0')}:${(s.elapsed.inSeconds % 60).toString().padLeft(2, '0')}";

  void start() {
    s.start();
    t = Timer.periodic(Duration(milliseconds: 100), (_) => setState(() {}));
  }

  void stop() {
    s.stop();
    t?.cancel();
  }

  void reset() {
    s.reset();
    setState(() {});
  }

  @override
  void dispose() { t?.cancel(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(time, style: TextStyle(fontSize: 48)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(onPressed: start, child: Text("Start")),
          SizedBox(width: 10),
          ElevatedButton(onPressed: stop, child: Text("Stop")),
          SizedBox(width: 10),
          ElevatedButton(onPressed: reset, child: Text("Reset")),
        ]),
      ])),
    );
  }
}