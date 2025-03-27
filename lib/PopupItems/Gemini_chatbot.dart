import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:vanilla_app/intro.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const GeminiChatApp());
}

class GeminiChatApp extends StatelessWidget {
  const GeminiChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final String apiKey = "AIzaSyAGXmFdDC2uBlnNtM4T60BiAYlr_wXpgfU"; // Replace with your Gemini API Key
  late GenerativeModel _model;

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(model: 'gemini-1.5-pro', apiKey: apiKey);
  }

  Future<void> sendMessage(String userMessage) async {
    if (userMessage.isEmpty) return;

    setState(() {
      _messages.add({"role": "user", "message": userMessage});
    });

    try {
      final content = await _model.generateContent([Content.text(userMessage)]);
      String botResponse = content.text ?? "I couldn't understand that.";

      setState(() {
        _messages.add({"role": "bot", "message": botResponse});
      });
    } catch (e) {
      setState(() {
        _messages.add({"role": "bot", "message": "Error: Unable to fetch response"});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gemini AI Chatbot",
          style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyIntro()),
              );
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://imgs.search.brave.com/sfqVZvAxc_0V_vB1v-l7ljQaMeuWC5k1RRnVF_kbgc8/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzJkL2Zl/LzZjLzJkZmU2Yzk2/ZThjODFhNjkwZGQ1/NDczNDE0MjY1ZDlk/LmpwZw'),
            fit: BoxFit.cover,
          ),
        ),
        // color: Colors.black54,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  final bool isUser = message["role"] == "user";
                  return Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isUser ? Color.fromARGB(240, 11, 106, 236) : Color.fromARGB(
                            240, 11, 106, 236),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        message["message"] ?? "",
                        style: TextStyle(color: isUser ? Colors.white : Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            Text("Made With Gemini",
            style: GoogleFonts.poppins(
              fontSize: 15,color: Colors.white,
            ),),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black, width: 3.5), // White border when not focused
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black, width: 7), // White border when focused
                        ),
                        // border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      sendMessage(_controller.text);
                      _controller.clear();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
