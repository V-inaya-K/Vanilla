// DEFAULT
import 'package:flutter/material.dart';
import 'package:vanilla_app/Splash.dart';
import 'package:vanilla_app/intro.dart';
import 'package:vanilla_app/Authentication/signup.dart';
import 'package:vanilla_app/PopupItems/Gemini_chatbot.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyIntro(),
    );
  }
}
// ----------------------------------------------


// ----------------------------------------------
// GEMINI API
// import 'package:flutter/material.dart';
// import 'scam_text_checker.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// void main() async {
//   await dotenv.load(fileName: "dev.env");
//   runApp(MaterialApp(home: ScamTextChecker()));
// }
// ----------------------------------------------------
// import 'package:flutter/material.dart';
// import 'scam_text_checker.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_gemini/flutter_gemini.dart';
//
// Future<void> main() async {
//   // Load the environment file for both Mobile and Web
//   await dotenv.load(fileName: "dev.env");
//
//   // Initialize the Gemini API with the key from the .env file
//   Gemini.init(apiKey: dotenv.env['GEMINI_API_KEY']!);
//
//   runApp(const ScamTextChecker());
// }
// ------------------------------------
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: ScamTextChecker(),
//   ));
// }
//
// class ScamTextChecker extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Scam Text Checker")),
//       body: Center(
//         child: Text("Gemini Scam Checker"),
//       ),
//     );
//   }
// }
