import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:vanilla_app/intro.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class ScamCallerid extends StatefulWidget {
  const ScamCallerid({super.key});

  @override
  State<ScamCallerid> createState() => _ScamCalleridState();
}

class _ScamCalleridState extends State<ScamCallerid> {
  String selectedCountryCode = '+1'; // Default country code
  final TextEditingController calleridController = TextEditingController();
  List<String> countryCodes = ['+1', '+44', '+91', '+61', '+81', '+92'];
  String _result = ""; // Store AI output

  final String apiKey = 'AIzaSyCrHyVnsBH7zsQMfjRZeK36AXhETEVMQP4';

  // Function to Call AI API
  Future<void> identifyFraud() async {
    String phoneNumber = "$selectedCountryCode${calleridController.text}";
    final String apiUrl =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey";

    final Map<String, dynamic> requestBody = {
      "contents": [
        {
          "parts": [
            {"text": "Is the phone number $phoneNumber associated with scams? Reply with only '⚠️️ Scam Caller' or 'Safe Caller'."}
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
        final outputText =
            responseData['candidates']?[0]['content']['parts']?[0]['text'] ??
                "No response received.";

        setState(() {
          _result = outputText; // Set AI result
        });
      } else {
        setState(() {
          _result = "Error: ${response.statusCode} - ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        _result = "Error: Failed to analyze the number.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scam CallerID Checker',
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
            Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  DropdownButton<String>(
                    value: selectedCountryCode,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCountryCode = newValue!;
                      });
                    },
                    items: countryCodes
                        .map<DropdownMenuItem<String>>((String code) {
                      return DropdownMenuItem<String>(
                        value: code,
                        child: Text(
                          code,
                          style: TextStyle(
                              color: Colors.white, backgroundColor: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                  Expanded(
                    child: TextField(
                      controller: calleridController,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
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
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style:
              ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
              onPressed: identifyFraud,
              child: Text(
                'Check for Scam',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: GoogleFonts.lato(
                fontSize: 18,
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
// -------------
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class ScamCallerid extends StatefulWidget {
//   const ScamCallerid({super.key});
//
//   @override
//   State<ScamCallerid> createState() => _ScamCalleridState();
// }
//
// class _ScamCalleridState extends State<ScamCallerid> {
//   String selectedCountryCode = '+1';
//   final TextEditingController calleridController = TextEditingController();
//   List<String> countryCodes = ['+1', '+44', '+91', '+61', '+81', '+92'];
//   String _result = "Waiting for bot response...";
//   final String botUsername = "TruecallerBot";
//
//   // Open Telegram and send phone number to bot
//   void sendPhoneNumberToBot() async {
//     String phoneNumber = "$selectedCountryCode${calleridController.text}";
//     String telegramUrl = "https://t.me/$botUsername?start=$phoneNumber";
//
//     setState(() {
//       _result = "Opening Telegram...";
//     });
//
//     try {
//       await launch(telegramUrl);
//       Future.delayed(Duration(seconds: 10), fetchBotResponse);
//     } catch (e) {
//       setState(() {
//         _result = "Error opening Telegram.";
//       });
//     }
//   }
//
//   // Fetch bot response from Python scraper
//   Future<void> fetchBotResponse() async {
//     final String scraperApiUrl = "http://127.0.0.1:5000/scrape?phone=${calleridController.text}";
//
//     try {
//       final response = await http.get(Uri.parse(scraperApiUrl));
//       if (response.statusCode == 200) {
//         final responseData = jsonDecode(response.body);
//         setState(() {
//           _result = responseData["response"] ?? "No response.";
//         });
//       } else {
//         setState(() {
//           _result = "Error fetching bot response.";
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _result = "Failed to get response.";
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Scam CallerID Checker',
//           style: GoogleFonts.lato(color: Colors.white),
//         ),
//         backgroundColor: Colors.black,
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(32),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               children: [
//                 DropdownButton<String>(
//                   value: selectedCountryCode,
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       selectedCountryCode = newValue!;
//                     });
//                   },
//                   items: countryCodes
//                       .map<DropdownMenuItem<String>>((String code) {
//                     return DropdownMenuItem<String>(
//                       value: code,
//                       child: Text(code, style: TextStyle(color: Colors.black)),
//                     );
//                   }).toList(),
//                 ),
//                 Expanded(
//                   child: TextField(
//                     controller: calleridController,
//                     maxLength: 10,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       hintText: 'Enter phone number',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
//               onPressed: sendPhoneNumberToBot,
//               child: Text('Check for Scam', style: TextStyle(color: Colors.white)),
//             ),
//             SizedBox(height: 20),
//             Text(
//               _result,
//               style: GoogleFonts.lato(
//                 fontSize: 18,
//                 color: (_result.toLowerCase().contains("scam"))
//                     ? Colors.red
//                     : Colors.white,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
