import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final cityController = TextEditingController();
  String result = '';

  Future<void> fetchWeather() async {
    final city = cityController.text;
    final apiKey = 'YOUR_API_KEY'; // Replace with your API key
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final temp = data['main']['temp'];
      final desc = data['weather'][0]['description'];
      setState(() {
        result = 'Temp: $temp°C\nCondition: $desc';
      });
    } else {
      setState(() {
        result = 'City not found';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Weather')),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: cityController,
                decoration: InputDecoration(labelText: 'Enter city'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: fetchWeather,
                child: Text('Get Weather'),
              ),
              SizedBox(height: 20),
              Text(result, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
