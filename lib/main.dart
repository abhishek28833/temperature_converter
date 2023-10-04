import 'package:flutter/material.dart';

void main() => runApp(TemperatureConverterApp());

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      home: TemperatureConverterScreen(),
    );
  }
}

class TemperatureConverterScreen extends StatefulWidget {
  @override
  _TemperatureConverterScreenState createState() =>
      _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState extends State<TemperatureConverterScreen> {
  TextEditingController _celsiusController = TextEditingController();
  TextEditingController _fahrenheitController = TextEditingController();

  void _convertCelsiusToFahrenheit() {
    double celsius = double.tryParse(_celsiusController.text) ?? 0.0;
    double fahrenheit = (celsius * 9 / 5) + 32;
    _fahrenheitController.text = fahrenheit.toStringAsFixed(2);
  }

  void _convertFahrenheitToCelsius() {
    double fahrenheit = double.tryParse(_fahrenheitController.text) ?? 0.0;
    double celsius = (fahrenheit - 32) * 5 / 9;
    _celsiusController.text = celsius.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _celsiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Celsius'),
            ),
            ElevatedButton(
              onPressed: _convertCelsiusToFahrenheit,
              child: Text('Convert to Fahrenheit'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _fahrenheitController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Fahrenheit'),
            ),
            ElevatedButton(
              onPressed: _convertFahrenheitToCelsius,
              child: Text('Convert to Celsius'),
            ),
          ],
        ),
      ),
    );
  }
}
