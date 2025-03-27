import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:vanilla_app/intro.dart';
import 'package:google_fonts/google_fonts.dart';

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
