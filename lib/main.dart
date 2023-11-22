import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      home: CurrencyConverter(),
    );
  }
}

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double exchangeRate = 4.96;
  double euros = 0;
  double ron = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Online Exchange Rate',
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image
            Image.network(
              'https://thumbs.dreamstime.com/b/money-background-11878218.jpg', // Imagine URL
              width: 300,
              height: 300,
            ),
            SizedBox(height: 20),
            // Input field
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  euros = double.tryParse(value) ?? 0;
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter the amount in Euro',
              ),
            ),
            SizedBox(height: 20),
            // Convert button
            TextButton(  //buton misto :))
              onPressed: () {
                setState(() {
                  // Perform the conversion
                  ron = euros * exchangeRate;
                });
              },
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            // resultat text
            Text('New Romanian Leu: $ron'),
          ],
        ),
      ),
    );
  }
}