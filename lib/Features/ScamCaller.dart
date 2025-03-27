import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:vanilla_app/intro.dart';
import 'package:google_fonts/google_fonts.dart';

class ScamCallerid extends StatefulWidget {
  const ScamCallerid({super.key});

  @override
  State<ScamCallerid> createState() => _ScamCalleridState();
}

class _ScamCalleridState extends State<ScamCallerid> {
  String selectedCountryCode = '+1'; // Default country code
  final TextEditingController phoneController = TextEditingController();
  List<String> countryCodes = ['+1', '+44', '+91', '+61', '+81','+92']; // Example country codes

  void identifyFraud() {
    String phoneNumber = phoneController.text;
    // Mock fraud detection logic
    if (phoneNumber.startsWith('123')) {
      // Assuming numbers starting with '123' are fraudulent
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Fraud Caller Detected!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Caller is Safe')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scam CallerID',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://imgs.search.brave.com/sfqVZvAxc_0V_vB1v-l7ljQaMeuWC5k1RRnVF_kbgc8/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzJkL2Zl/LzZjLzJkZmU2Yzk2/ZThjODFhNjkwZGQ1/NDczNDE0MjY1ZDlk/LmpwZw'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                DropdownButton<String>(
                  value: selectedCountryCode,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCountryCode = newValue!;
                    });
                  },
                  items: countryCodes.map<DropdownMenuItem<String>>((String code) {
                    return DropdownMenuItem<String>(


                      value: code,
                      child: Text(code,style: TextStyle(
                          color: Colors.black,
                          backgroundColor: Colors.white
                      ),),
                    );
                  }).toList(),
                ),
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter phone number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900]
              ),
              onPressed: identifyFraud,
              child: Text('Check',style:
              TextStyle(
                  color: Colors.white
              ),),
            ),
          ],
        ),
      ),
    );
  }
}