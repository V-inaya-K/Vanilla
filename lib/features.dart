// features/scam_text_message_checker.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//Scam CallerID



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

// class ScamCallerid extends StatefulWidget {
//   const ScamCallerid({super.key});

//   @override
//   State<ScamCallerid> createState() => _ScamCalleridState();
// }

// class _ScamCalleridState extends State<ScamCallerid> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child:Column(children: [

//         ],) ,

//         alignment: Alignment.center,
//         padding: EdgeInsets.all(32),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage('https://imgs.search.brave.com/sfqVZvAxc_0V_vB1v-l7ljQaMeuWC5k1RRnVF_kbgc8/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzJkL2Zl/LzZjLzJkZmU2Yzk2/ZThjODFhNjkwZGQ1/NDczNDE0MjY1ZDlk/LmpwZw'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         ),
//       appBar: AppBar(
//         title: Text('Scam CallerID',
//         style: TextStyle(color: Colors.white),),
//         backgroundColor: Colors.black,
//         elevation: 0,
//         iconTheme: IconThemeData(color: const Color.fromARGB(255, 255, 255, 255)),
//       ),
//     );
//   }
// }


//Hardcode
class ScamWebsite extends StatefulWidget {
  const ScamWebsite({super.key});

  @override
  State<ScamWebsite> createState() => _ScamWebsiteState();
}

class _ScamWebsiteState extends State<ScamWebsite> {
  final TextEditingController _emailController = TextEditingController();
  String _resultMessage = '';

  void _checkEmailForScam() {
    String email = _emailController.text.trim().toLowerCase();

    if (email.isEmpty) {
      setState(() {
        _resultMessage = 'Please enter an email.';
      });
      return;
    }

    // List of common scam email indicators
    List<String> scamKeywords = [
      "urgent", "password reset", "verify account", "click here",
      "lottery", "free money", "bank transfer", "confidential", "prize",
      "security alert", "update your information", "win big",
      "dear customer", "congratulations", "act now", "account suspended"
    ];

    List<String> suspiciousDomains = [
      "mail.ru", "freemail.com", "xyzbank-secure.com", "paypal-security.net", "freelottery.com",
      "urgent-update.com",
      "passwordreset-now.com",
      "lottery",
      "verify-account.net",
      "clickhere-secure.com",
      "lottery-winner.com",
      "freemoney-offer.com",
      "banktransfer-alert.com",
      "confidential-mail.com",
      "prize-claim.com",
      "security-alert-message.com",
      "update-yourinfo.com",
      "winbig-today.com",
      "dearcustomer-support.com",
      "congratulations-gift.com",
      "actnow-response.com",
      "account-suspended-warning.com"
    ];

    bool hasScamKeywords = scamKeywords.any((word) => email.contains(word));
    bool hasSuspiciousDomain = suspiciousDomains.any((domain) => email.contains(domain));

    setState(() {
      if (hasScamKeywords || hasSuspiciousDomain) {
        _resultMessage = '⚠️ This email looks like a scam!';
      } else {
        _resultMessage = '✅ This email appears to be safe.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scam Website Checker',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://imgs.search.brave.com/sfqVZvAxc_0V_vB1v-l7ljQaMeuWC5k1RRnVF_kbgc8/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzJkL2Zl/LzZjLzJkZmU2Yzk2/ZThjODFhNjkwZGQ1/NDczNDE0MjY1ZDlk/LmpwZw',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Enter Website DNS',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkEmailForScam,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
              child: const Text(
                'Check Email',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _resultMessage,
              style: TextStyle(
                fontSize: 18,
                color: _resultMessage.contains('scam') ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Scam Website

// class ScamWebsite extends StatefulWidget {
//   const ScamWebsite({super.key});
//
//   @override
//   State<ScamWebsite> createState() => _ScamWebsiteState();
// }
//
// class _ScamWebsiteState extends State<ScamWebsite> {
//   final TextEditingController _urlController = TextEditingController();
//   String _resultMessage = '';
//   final String _apiKey = 'AIzaSyBFSt6vdecVFFw1bOOKQB2tjWS60VuQVcg'; // Replace with your actual API key
//
//   Future<bool> _checkUrlWithGoogleSafeBrowsing(String url) async {
//     final requestBody = {
//       "client": {
//         "clientId": "your-company-name",
//         "clientVersion": "1.0"
//       },
//       "threatInfo": {
//         "threatTypes": ["MALWARE", "SOCIAL_ENGINEERING", "UNWANTED_SOFTWARE"],
//         "platformTypes": ["ANY_PLATFORM"],
//         "threatEntryTypes": ["URL"],
//         "threatEntries": [
//           {"url": url}
//         ]
//       }
//     };
//
//     final response = await http.post(
//       Uri.parse('https://safebrowsing.googleapis.com/v4/threatMatches:find?key=$_apiKey'),
//       headers: {"Content-Type": "application/json"},
//       body: json.encode(requestBody),
//     );
//
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       return data['matches'] != null; // Returns true if the URL is found in the threats list
//     } else {
//       throw Exception('Failed to check URL');
//     }
//   }
//
//   void _checkWebsite() async {
//     final url = _urlController.text.trim();
//     if (url.isEmpty) {
//       setState(() {
//         _resultMessage = 'Please enter a URL.';
//       });
//       return;
//     }
//
//     try {
//       final isFraudulent = await _checkUrlWithGoogleSafeBrowsing(url);
//       setState(() {
//         _resultMessage = isFraudulent ? 'This website is fraudulent!' : 'This website is safe.';
//       });
//     } catch (e) {
//       setState(() {
//         _resultMessage = 'Error checking URL: $e';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Scam Website',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.black,
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(32),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage(
//               'https://imgs.search.brave.com/sfqVZvAxc_0V_vB1v-l7ljQaMeuWC5k1RRnVF_kbgc8/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzJkL2Zl/LzZjLzJkZmU2Yzk2/ZThjODFhNjkwZGQ1/NDczNDE0MjY1ZDlk/LmpwZw',
//             ),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _urlController,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: const Color.fromARGB(255, 201, 195, 195),
//                 // labelText: 'Enter URL',
//                 hintText: 'Enter URL',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _checkWebsite,
//               child: Text('Check',
//                 style: TextStyle(
//                   color: Colors.white
//                 ),
//               ),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue[900]
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               _resultMessage,
//               style: TextStyle(fontSize: 18, color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ScamWebsite extends StatefulWidget {
//   const ScamWebsite({super.key});

//   @override
//   State<ScamWebsite> createState() => _ScamWebsiteState();
// }

// class _ScamWebsiteState extends State<ScamWebsite> {
//   final TextEditingController _urlController = TextEditingController();
//   String _resultMessage = '';

//   // Simulated function to check for fraudulent websites
//   bool _isFraudulent(String url) {
//     // This is a placeholder for actual fraud detection logic.
//     // In a real application, you might use an API or a database.
//     const List<String> fraudulentUrls = [
//       'http://scamwebsite.com',
//       'http://fakebank.com',
//       'http://phishingexample.com'
//     ];
//     return fraudulentUrls.contains(url);
//   }

//   void _checkWebsite() {
//     final url = _urlController.text.trim();
//     if (url.isEmpty) {
//       setState(() {
//         _resultMessage = 'Please enter a URL.';
//       });
//       return;
//     }

//     setState(() {
//       _resultMessage = _isFraudulent(url) ? 'This website is fraudulent!' : 'This website is safe.';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Scam Website',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.black,
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(32),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage(
//               'https://imgs.search.brave.com/sfqVZvAxc_0V_vB1v-l7ljQaMeuWC5k1RRnVF_kbgc8/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzJkL2Zl/LzZjLzJkZmU2Yzk2/ZThjODFhNjkwZGQ1/NDczNDE0MjY1ZDlk/LmpwZw',
//             ),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _urlController,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: const Color.fromARGB(255, 201, 195, 195),
//                 // labelText: 'Enter URL',
//                 hintText: 'Enter URL',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(

//               onPressed: _checkWebsite,
//               child: Text('Check',
//               style:TextStyle(
//                 color: Colors.white
//               ) ,),
//               style: ElevatedButton.styleFrom(

//                 backgroundColor: Colors.blue[900]
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               _resultMessage,
//               style: TextStyle(fontSize: 18, color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//Scam Email



class ScamEmail extends StatefulWidget {
  const ScamEmail({super.key});

  @override
  State<ScamEmail> createState() => _ScamEmailState();
}

class _ScamEmailState extends State<ScamEmail> {
  final TextEditingController _emailController = TextEditingController();
  String _result = '';

  void _identifyFraudEmail() {
    String email = _emailController.text;

    // Simple heuristic for identifying scam emails (for demonstration)
    if (email.contains("urgent") || email.contains("winner") || email.contains("click here")) {
      setState(() {
        _result = "This email looks suspicious!";
      });
    } else {
      setState(() {
        _result = "This email seems safe.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scam Email',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: const Color.fromARGB(255, 255, 255, 255)),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://imgs.search.brave.com/sfqVZvAxc_0V_vB1v-l7ljQaMeuWC5k1RRnVF_kbgc8/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzJkL2Zl/LzZjLzJkZmU2Yzk2/ZThjODFhNjkwZGQ1/NDczNDE0MjY1ZDlk/LmpwZw'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Enter Email Content',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _identifyFraudEmail,
              child: Text('Check for Scam'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// class ScamEmail extends StatefulWidget {
//   const ScamEmail({super.key});

//   @override
//   State<ScamEmail> createState() => _ScamEmailState();
// }

// class _ScamEmailState extends State<ScamEmail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child:Column(children: [

//         ],) ,
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(32),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage('https://imgs.search.brave.com/sfqVZvAxc_0V_vB1v-l7ljQaMeuWC5k1RRnVF_kbgc8/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzJkL2Zl/LzZjLzJkZmU2Yzk2/ZThjODFhNjkwZGQ1/NDczNDE0MjY1ZDlk/LmpwZw'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         ),
//       appBar: AppBar(
//         title: Text('Scam Email',
//         style: TextStyle(color: Colors.white),),
//         backgroundColor: Colors.black,
//         elevation: 0,
//         iconTheme: IconThemeData(color: const Color.fromARGB(255, 255, 255, 255)),
//       ),
//     );
//   }
// }

//Scam Message
//
// class ScamText extends StatefulWidget {
//   const ScamText({super.key});
//
//   @override
//   State<ScamText> createState() => _ScamTextState();
// }
//
// class _ScamTextState extends State<ScamText> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child:Column(children: [
//
//         ],) ,
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(32),
//         decoration: BoxDecoration(
//
//           image: DecorationImage(
//             image: NetworkImage('https://imgs.search.brave.com/sfqVZvAxc_0V_vB1v-l7ljQaMeuWC5k1RRnVF_kbgc8/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzJkL2Zl/LzZjLzJkZmU2Yzk2/ZThjODFhNjkwZGQ1/NDczNDE0MjY1ZDlk/LmpwZw'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         ),
//       appBar: AppBar(
//         title: Text('Scam Message',
//         style: TextStyle(color: Colors.white),),
//         backgroundColor: Colors.black,
//         elevation: 0,
//         iconTheme: IconThemeData(color: const Color.fromARGB(255, 255, 255, 255)),
//       ),
//     );
//   }
// }
// ====================

// Hardcode
class ScamText extends StatefulWidget {
  const ScamText({super.key});

  @override
  State<ScamText> createState() => _ScamTextState();
}

class _ScamTextState extends State<ScamText> {
  final TextEditingController _messageController = TextEditingController();
  String _result = '';

  void _checkForScam() {
    String message = _messageController.text.toLowerCase();

    // List of common scam keywords
    List<String> scamKeywords = [
      "winner", "congratulations", "click here", "urgent",
      "claim now", "free", "limited time", "act now", "bank",
      "lottery", "prize", "money transfer", "password reset"
    ];

    bool isScam = scamKeywords.any((word) => message.contains(word));

    setState(() {
      _result = isScam ? "⚠️ This message looks suspicious!" : "✅ This message seems safe.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scam Message',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://imgs.search.brave.com/sfqVZvAxc_0V_vB1v-l7ljQaMeuWC5k1RRnVF_kbgc8/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzJkL2Zl/LzZjLzJkZmU2Yzk2/ZThjODFhNjkwZGQ1/NDczNDE0MjY1ZDlk/LmpwZw',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'Enter message content',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkForScam,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
              child: const Text(
                'Check for Scam',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(
                fontSize: 18,
                color: _result.contains('suspicious') ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// class ScamWebsite extends StatefulWidget {
//   const ScamWebsite({super.key});

//   @override
//   State<ScamWebsite> createState() => _ScamWebsiteState();
// }

// class _ScamWebsiteState extends State<ScamWebsite> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child:Column(children: [

//         ],) ,
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(32),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage('https://imgs.search.brave.com/sfqVZvAxc_0V_vB1v-l7ljQaMeuWC5k1RRnVF_kbgc8/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzJkL2Zl/LzZjLzJkZmU2Yzk2/ZThjODFhNjkwZGQ1/NDczNDE0MjY1ZDlk/LmpwZw'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         ),
//       appBar: AppBar(
//         title: Text('Scam Email',
//         style: TextStyle(color: Colors.white),),
//         backgroundColor: Colors.black,
//         elevation: 0,
//         iconTheme: IconThemeData(color: const Color.fromARGB(255, 255, 255, 255)),
//       ),
//     );
//   }
// }

// -------------------