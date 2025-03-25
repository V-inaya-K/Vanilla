// // // import 'package:flutter/material.dart';
// // // import 'package:http/http.dart' as http;
// // // import 'dart:convert';
// // // import 'package:flutter_dotenv/flutter_dotenv.dart';
// // //
// // // class ScamTextChecker extends StatefulWidget {
// // //   const ScamTextChecker({super.key});
// // //
// // //   @override
// // //   State<ScamTextChecker> createState() => _ScamTextCheckerState();
// // // }
// // //
// // // class _ScamTextCheckerState extends State<ScamTextChecker> {
// // //   final TextEditingController _textController = TextEditingController();
// // //   String _result = '';
// // //
// // //   // Future<void> checkScamMessage(String text) async {
// // //   //   final apiKey = dotenv.env['GEMINI_API_KEY'];
// // //   //
// // //   //   // final response = await http.post(
// // //   //   //   Uri.parse('https://generativelanguage.googleapis.com/v1beta2/models/gemini-pro:generateText?key=$apiKey'),
// // //   //   //   headers: {
// // //   //   //     'Content-Type': 'application/json',
// // //   //   //   },
// // //   //   //   body: json.encode({
// // //   //   //     "prompt": {
// // //   //   //       "text": "Is the following message a scam? Reply with 'Yes' or 'No' only: $text"
// // //   //   //     }
// // //   //   //   }),
// // //   //   // );
// // //   //   final response = await http.post(
// // //   //     Uri.parse('https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateText?key=$apiKey'),
// // //   //     headers: {
// // //   //       'Content-Type': 'application/json',
// // //   //     },
// // //   //     body: json.encode({
// // //   //       "prompt": {
// // //   //         "text": "Is the following message a scam? Reply with 'Yes' or 'No' only: $text"
// // //   //       }
// // //   //     }),
// // //   //   );
// // //   //
// // //   //   final data = json.decode(response.body);
// // //   //
// // //   //   if (response.statusCode == 200) {
// // //   //     setState(() {
// // //   //       _result = data['candidates'][0]['output'];
// // //   //     });
// // //   //   } else {
// // //   //     setState(() {
// // //   //       _result = 'Error: ${data['error']['message']}';
// // //   //     });
// // //   //   }
// // //   // }
// // //   Future<void> checkScamMessage(String text) async {
// // //     final apiKey = dotenv.env['GEMINI_API_KEY'];
// // //
// // //     // final response = await http.post(
// // //     //   Uri.parse('https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent?key=$apiKey'),
// // //     //   headers: {
// // //     //     'Content-Type': 'application/json',
// // //     //   },
// // //     //   body: json.encode({
// // //     //     "contents": [
// // //     //       {
// // //     //         "parts": [
// // //     //           {
// // //     //             "text": "Is the following message a scam? Reply with 'Yes' or 'No' only: $text"
// // //     //           }
// // //     //         ]
// // //     //       }
// // //     //     ]
// // //     //   }),
// // //     // );
// // //     final response = await http.post(
// // //       Uri.parse('https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey'),
// // //       headers: {
// // //         'Content-Type': 'application/json',
// // //       },
// // //       body: json.encode({
// // //         "contents": [
// // //           {
// // //             "parts": [
// // //               {
// // //                 "text": "Is the following message a scam? Reply with 'Yes' or 'No' only: $text"
// // //               }
// // //             ]
// // //           }
// // //         ]
// // //       }),
// // //     );
// // //
// // //
// // //     final data = json.decode(response.body);
// // //
// // //     if (response.statusCode == 200) {
// // //       setState(() {
// // //         _result = data['candidates'][0]['content']['parts'][0]['text'];
// // //       });
// // //     } else {
// // //       setState(() {
// // //         _result = 'Error: ${data['error']['message']}';
// // //       });
// // //     }
// // //   }
// // //
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Scam Text Detector'),
// // //         backgroundColor: Colors.black,
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(20.0),
// // //         child: Column(
// // //           children: [
// // //             TextField(
// // //               controller: _textController,
// // //               decoration: InputDecoration(
// // //                 hintText: 'Enter text message to check...',
// // //                 border: OutlineInputBorder(),
// // //               ),
// // //             ),
// // //             const SizedBox(height: 20),
// // //             ElevatedButton(
// // //               onPressed: () {
// // //                 if (_textController.text.isNotEmpty) {
// // //                   checkScamMessage(_textController.text);
// // //                 }
// // //               },
// // //               child: const Text('Check for Scam'),
// // //             ),
// // //             const SizedBox(height: 20),
// // //             Text(_result, style: const TextStyle(fontSize: 18, color: Colors.red)),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // // -----------------------
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// // import 'package:flutter_dotenv/flutter_dotenv.dart';
// //
// // class ScamTextChecker extends StatefulWidget {
// //   const ScamTextChecker({super.key});
// //
// //   @override
// //   State<ScamTextChecker> createState() => _ScamTextCheckerState();
// // }
// //
// // class _ScamTextCheckerState extends State<ScamTextChecker> {
// //   final TextEditingController _textController = TextEditingController();
// //   String _result = '';
// //
// //   Future<void> checkScamMessage(String text) async {
// //     final apiKey = dotenv.env['GEMINI_API_KEY'];
// //
// //     final response = await http.post(
// //       Uri.parse(
// //           'https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent?key=$apiKey'),
// //       headers: {
// //         'Content-Type': 'application/json',
// //       },
// //       body: json.encode({
// //         "contents": [
// //           {
// //             "parts": [
// //               {
// //                 "text": "Is the following message a scam? Reply with 'Yes' or 'No' only: $text"
// //               }
// //             ]
// //           }
// //         ]
// //       }),
// //     );
// //
// //     final data = json.decode(response.body);
// //
// //     if (response.statusCode == 200) {
// //       setState(() {
// //         _result = data['candidates'][0]['content']['parts'][0]['text'];
// //       });
// //     } else {
// //       setState(() {
// //         _result = 'Error: ${data['error']['message']}';
// //       });
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Scam Text Detector'),
// //         backgroundColor: Colors.black,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(20.0),
// //         child: Column(
// //           children: [
// //             TextField(
// //               controller: _textController,
// //               decoration: InputDecoration(
// //                 hintText: 'Enter text message to check...',
// //                 border: OutlineInputBorder(),
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () {
// //                 if (_textController.text.isNotEmpty) {
// //                   checkScamMessage(_textController.text);
// //                 }
// //               },
// //               child: const Text('Check for Scam'),
// //             ),
// //             const SizedBox(height: 20),
// //             Text(_result,
// //                 style: const TextStyle(fontSize: 18, color: Colors.red)),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// // -----
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_gemini/flutter_gemini.dart';
//
// class ScamTextChecker extends StatefulWidget {
//   const ScamTextChecker({Key? key}) : super(key: key);
//
//   @override
//   State<ScamTextChecker> createState() => _ScamTextCheckerState();
// }
//
// class _ScamTextCheckerState extends State<ScamTextChecker> {
//   final TextEditingController _textController = TextEditingController();
//   String _result = '';
//
//   late final Gemini gemini;
//
//   @override
//   void initState() {
//     super.initState();
//     gemini = Gemini.instance;
//     gemini = Gemini.instance.init(apiKey: dotenv.env['GEMINI_API_KEY']!);
//
//     // gemini.apiKey = dotenv.env['GEMINI_API_KEY']!;
//   }
//
//   Future<void> checkScamMessage(String text) async {
//     final prompt = "Is the following message a scam? Reply with 'Yes' or 'No' only: $text";
//
//     try {
//       final response = await gemini.text(prompt);
//       setState(() {
//         _result = response?.output ?? 'No response from Gemini';
//       });
//     } catch (e) {
//       setState(() {
//         _result = 'Error: $e';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Scam Text Detector')),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _textController,
//               decoration: const InputDecoration(
//                 hintText: 'Enter the message...',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 if (_textController.text.isNotEmpty) {
//                   checkScamMessage(_textController.text);
//                 }
//               },
//               child: const Text('Check for Scam'),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               _result,
//               style: const TextStyle(fontSize: 18, color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// ----------------------
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ScamTextChecker extends StatefulWidget {
  const ScamTextChecker({Key? key}) : super(key: key);

  @override
  State<ScamTextChecker> createState() => _ScamTextCheckerState();
}

class _ScamTextCheckerState extends State<ScamTextChecker> {
  final TextEditingController _textController = TextEditingController();
  String _result = '';

  final gemini = Gemini.instance; // ✅ Correct way to access Gemini instance

  Future<void> checkScamMessage(String text) async {
    final prompt = "Is the following message a scam? Reply with 'Yes' or 'No' only: $text";

    try {
      final response = await gemini.text(prompt);
      setState(() {
        _result = response?.output ?? 'No response from Gemini';
      });
    } catch (e) {
      setState(() {
        _result = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scam Text Detector')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Enter the message...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  checkScamMessage(_textController.text);
                }
              },
              child: const Text('Check for Scam'),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 18, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
