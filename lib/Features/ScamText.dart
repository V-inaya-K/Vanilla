import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:vanilla_app/intro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translator/translator.dart';

class ScamText extends StatefulWidget {
  const ScamText({super.key});

  @override
  State<ScamText> createState() => _ScamTextState();
}

class _ScamTextState extends State<ScamText> {
  final TextEditingController _messageController = TextEditingController();
  String _result = '';
  final String apiKey = '{API KEY}';

  Future<void> _identifyFraudEmail() async {
    final String userInput = _messageController.text;
    final String apiUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey";

    final Map<String, dynamic> requestBody = {
      "contents": [
        {
          "parts": [
            {"text": "Analyze this Text Message and respond with only two words, like '⚠️️ Scam Message' or 'Safe Message': $userInput"}
          ]
        }
      ]
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final outputText = responseData['candidates']?[0]['content']['parts']?[0]['text'] ?? "No response received.";

        setState(() {
          _result = outputText;
        });
      } else {
        setState(() {
          _result = "Error: ${response.statusCode} - ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        _result = "Error: Failed to analyze the email. $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scam Message Checker',
          style: GoogleFonts.lato(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
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
            TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Enter Message Content',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _identifyFraudEmail,
              child: Text('Check for Scam',style: GoogleFonts.poppins(color: Colors.white),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: GoogleFonts.lato(
                fontSize: 25,
                color: (_result.toLowerCase().contains("scam"))
                    ? Colors.red
                    : Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
