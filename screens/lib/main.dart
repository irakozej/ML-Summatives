import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(PredictorApp());
}

class PredictorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Internet Speed Predictor',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PredictionScreen(),
    );
  }
}

class PredictionScreen extends StatefulWidget {
  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final TextEditingController _numDevicesController = TextEditingController();
  String _predictionResult = "";

  Future<void> _predictSpeed() async {
    final String apiUrl = "https://700a-34-106-59-83.ngrok-free.app/predict";

    if (_numDevicesController.text.isEmpty) {
      setState(() {
        _predictionResult = "Please enter the number of connected devices.";
      });
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "num_devices": int.parse(_numDevicesController.text),
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _predictionResult =
              "Predicted Speed: ${data['predicted_speed']} Mbps";
        });
      } else {
        setState(() {
          _predictionResult = "Error: ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        _predictionResult = "Failed to connect to API";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Speed Predictor')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _numDevicesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number of Connected Devices',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(onPressed: _predictSpeed, child: Text('Predict')),
            SizedBox(height: 16.0),
            Text(
              _predictionResult,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
