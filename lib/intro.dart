import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:vanilla_app/Features/ScamEmail.dart';
import 'package:vanilla_app/Features/ScamText.dart';
import 'package:vanilla_app/Features/ScamWebsite.dart';
import 'package:vanilla_app/Features/ScamCaller.dart';
import 'package:vanilla_app/Authentication/signup.dart';
import 'package:vanilla_app/PopupItems/Gemini_chatbot.dart';
import 'package:google_fonts/google_fonts.dart';
class MyIntro extends StatefulWidget {
  @override
  _MyIntroState createState() => _MyIntroState();
}

class _MyIntroState extends State<MyIntro> {
  bool isLogin = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  int _selectedPage = 0;
  final translator = GoogleTranslator();
  String _selectedLanguage = 'English';
  String buttonText = 'Verify';

  final List<String> languages = ['English', 'Tamil', 'Hindi'];

  final List<String> titles = [
    'Scam Caller-ID Checker',
    'Scam Website Checker',
    'Scam Message Checker',
    'Scam Email Checker',
  ];

  final List<String> subtitles = [
    'Allow you to check for fraud Caller-ID',
    'Allow you to check for fraud Website',
    'Allow you to check for fraud Messages',
    'Allow you to check for fraud Email',
  ];

  final List<Widget> pages = [
    ScamCallerid(),
    ScamWebsite(),
    ScamText(),
    ScamEmail(),
  ];

  void _translateTexts() async {
    for (int i = 0; i < titles.length; i++) {
      var translatedTitle = await translator.translate(titles[i], to: _selectedLanguage.substring(0, 2).toLowerCase());
      var translatedSubtitle = await translator.translate(subtitles[i], to: _selectedLanguage.substring(0, 2).toLowerCase());
      var translatedButton = await translator.translate('Verify', to: _selectedLanguage.substring(0, 2).toLowerCase());
      setState(() {
        titles[i] = translatedTitle.text;
        subtitles[i] = translatedSubtitle.text;
        buttonText = translatedButton.text;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://imgs.search.brave.com/sfqVZvAxc_0V_vB1v-l7ljQaMeuWC5k1RRnVF_kbgc8/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzJkL2Zl/LzZjLzJkZmU2Yzk2/ZThjODFhNjkwZGQ1/NDczNDE0MjY1ZDlk/LmpwZw'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Vanilla",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => _showPopup(context, ChatbotPopup()),
                        color: Colors.white,
                        icon: Icon(Icons.message),
                      ),
                      IconButton(
                        onPressed: () => _showPopup(context, NotificationsPopup()),
                        color: Colors.white,
                        icon: Icon(Icons.notifications),
                      ),
                      IconButton(
                        onPressed: () => _showPopup(context, ProfilePopup()),
                        color: Colors.white,
                        icon: Icon(Icons.account_circle_rounded),
                      ),
                      DropdownButton<String>(
                        value: _selectedLanguage,
                        dropdownColor: Colors.black,
                        icon: Icon(Icons.language, color: Colors.white),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedLanguage = newValue!;
                            _translateTexts();
                          });
                        },
                        items: languages.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: TextStyle(color: Colors.white)),
                          );
                        }).toList(),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        icon: Icon(Icons.logout, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),

            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                hintStyle: TextStyle(color: Colors.black),
                hintText: "Search",
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return CustomTile(
                    title: titles[index],
                    subtitle: subtitles[index],
                    page: pages[index],
                    buttonText: buttonText,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPopup(BuildContext context, Widget popup) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: popup,
        );
      },
    );
  }
}

class CustomTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget page;
  final String buttonText;

  CustomTile({required this.title, required this.subtitle, required this.page, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Colors.black.withOpacity(0.3),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.white),
      ),
      child: ListTile(
        title: Text(title, style: TextStyle(color: Colors.white)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.white)),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[900],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          child: Text(buttonText, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

class ChatbotPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.white, width: 2), // Blue border
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(15),
      // color: Colors.white,
      constraints: BoxConstraints(
        maxWidth: 300,
        maxHeight: 150, // Reduced height
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Makes the column take only necessary space
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(Icons.chat, color: Colors.blue), // Added icon
              SizedBox(width: 8),
              Text(
                "AI Chatbot",
                style:  GoogleFonts.poppins(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => GeminiChatApp()),
              );
            },
            child: Text('Go to Chatbot', style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.white,
            )),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900])
          ),
        ],
      ),
    );
  }
}


class NotificationsPopup extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {"title": "New Message", "message": "You have a new message from John."},
    {"title": "Reminder", "message": "Meeting scheduled at 3 PM today."},
    {"title": "Battery Low", "message": "Your battery is at 15%. Please charge soon."},
    {"title": "Friend Request", "message": "Alex sent you a friend request."},
    {"title": "Update Available", "message": "A new app update is available."},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.white, width: 2), // Blue border
        borderRadius: BorderRadius.circular(10),
      ),
      constraints: BoxConstraints(
        maxWidth: 300,
        maxHeight: 600, // Reduced height
      ),
      padding: EdgeInsets.all(20),
      // color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Notifications",
            style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
          ),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: notifications.map((notif) {
                  return SingleChildScrollView(
                    scrollDirection : Axis.vertical,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 290,
            
                         // Reduced height
                      ),
            
                      margin: EdgeInsets.only(bottom: 10),
                      width: 290,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notif["title"]!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(notif["message"]!),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePopup extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        children: [
         
        ],
      ),
    );
  }
}

