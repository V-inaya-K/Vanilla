import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:vanilla_app/features.dart';
import 'package:vanilla_app/Authentication/signup.dart';

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
          children: [
            Row(
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
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Text("Chatbot Content"),
    );
  }
}

class NotificationsPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Text("Notifications Content"),
    );
  }
}

class ProfilePopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Text("Profile Content"),
    );
  }
}


//                                             // import 'package:flutter/material.dart';
// // import 'package:vanilla_app/features.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:vanilla_app/signup.dart';
// // class MyIntro extends StatelessWidget {
// //   int _selectedPage = 0;
// //
// //   // Sample data arrays for titles and subtitles
// //   final List<String> titles = [
// //     'Scam Caller-ID Checker',
// //     'Scam Website Checker',
// //     'Scam Message Checker',
// //     'Scam Email Checker',
// //   ];
// //
// //   final List<String> subtitles = [
// //     'Allow you to check for fraud Caller-ID',
// //     'Allow you to check for fraud Website',
// //     'Allow you to check for fraud Messages',
// //     'Allow you to check for fraud Email',
// //   ];
// //
// //   final List<Widget> pages = [
// //     ScamCallerid(), // Replace with your actual page widgets
// //     ScamWebsite(),
// //     ScamText(),
// //     ScamEmail(),
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // bottomNavigationBar: BottomNavigationBar(
// //       //   items: const <BottomNavigationBarItem>[
// //       //     BottomNavigationBarItem(
// //       //       icon: Icon(_selectedPage == 0
// //       //           ? CupertinoIcons.house_fill
// //       //           : CupertinoIcons.house),
// //       //       label: "Home",
// //       //     ),
// //       //     BottomNavigationBarItem(
// //       //       icon: Icon(_selectedPage == 1
// //       //           ? CupertinoIcons.square_grid_2x2_fill
// //       //           : CupertinoIcons.square_grid_2x2),
// //       //       label: "Category",
// //       //     ),
// //       //     BottomNavigationBarItem(
// //       //       icon: Icon(_selectedPage == 2
// //       //           ? CupertinoIcons.cart_fill
// //       //           : CupertinoIcons.cart),
// //       //       label: "Cart",
// //       //     ),
// //       //     BottomNavigationBarItem(
// //       //       icon: Icon(_selectedPage == 3
// //       //           ? CupertinoIcons.person_fill
// //       //           : CupertinoIcons.person),
// //       //       label: "Profile",
// //       //     ),
// //       //
// //       //   ],
// //       // ),
// //
// //       body: Container(
// //
// //         child: Column(
// //
// //           children: [
// //             Row(
// //
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Text(
// //                   "Vanilla",
// //                   style: TextStyle(
// //                     fontSize: 25,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //                 Row(
// //                   children: [
// //                     IconButton(
// //                       onPressed: () {},
// //                       color: Colors.white,
// //                       icon: Icon(Icons.message),
// //                     ),
// //                     IconButton(
// //                       onPressed: () {},
// //                       color: Colors.white,
// //                       icon: Icon(Icons.notifications),
// //                     ),
// //                     IconButton(
// //                       onPressed: () {},
// //                       color: Colors.white,
// //                       icon: Icon(Icons.account_circle_rounded),
// //                     ),
// //                     IconButton(               //LAST UPDATE
// //                       onPressed: () {
// //                         Navigator.pushReplacement(
// //                           context,
// //                           MaterialPageRoute(builder: (context) => AuthScreen()),
// //                         );
// //                       },
// //                       icon: Icon(Icons.logout),
// //                       color: Colors.white,
// //                     ),
// //                   ],
// //                 )
// //               ],
// //             ),
// //             SizedBox(height: 10),
// //             TextField(
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 isDense: true,
// //                 contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
// //                 hintStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
// //                 hintText: "Search",
// //                 suffixIcon: const Icon(Icons.search),
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(20.0),
// //                   borderSide: const BorderSide(),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             Expanded(
// //               child: ListView.builder(
// //                 itemCount: titles.length, // Number of items in the list
// //                 itemBuilder: (context, index) {
// //                   return CustomTile(
// //
// //                     title: titles[index],
// //                     subtitle: subtitles[index],
// //                     page: pages[index],
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //
// //         alignment: Alignment.center,
// //         padding: EdgeInsets.all(32),
// //         decoration: BoxDecoration(
// //           image: DecorationImage(
// //             // image: NetworkImage('https://imgs.search.brave.com/EFXyqZ-WmpA2KeniUmPNZnIvskZMLvIHv80NQ9Bv8hg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTE0/NTM1MDQ1Ny92ZWN0/b3IvYWJzdHJhY3Qt/bWVjaGFuaWNhbC1i/YWNrZ3JvdW5kLmpw/Zz9zPTYxMng2MTIm/dz0wJms9MjAmYz1W/Y3NvM0hEQ0hkeXd2/dWsxMEZQT2hwWXVq/eFBYQ25nMlZ5ckhq/RDhxSFFjPQ'),
// //             image: NetworkImage('https://imgs.search.brave.com/sfqVZvAxc_0V_vB1v-l7ljQaMeuWC5k1RRnVF_kbgc8/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzJkL2Zl/LzZjLzJkZmU2Yzk2/ZThjODFhNjkwZGQ1/NDczNDE0MjY1ZDlk/LmpwZw'),
// //             fit: BoxFit.cover,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class CustomTile extends StatelessWidget {
// //   final String title;
// //   final String subtitle;
// //   final Widget page;
// //
// //
// //   CustomTile({required this.title, required this.subtitle,required this.page});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       margin: EdgeInsets.all(10),
// //       color: Colors.black.withOpacity(0.3),
// //       elevation: 5, // Add elevation for shadow effect
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(10), // Optional: round the corners
// //         side: BorderSide(color: Colors.white)
// //       ),
// //       child: ListTile(
// //         title: Text(title,
// //         style: TextStyle(
// //           color: Colors.white
// //         )
// //         ),
// //         subtitle: Text(subtitle,
// //         style: TextStyle(
// //           color: Colors.white),
// //         ),
// //         trailing: Column(
// //
// //           children: [
// //             ElevatedButton(
// //               style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.blue[900]
// //
// //               ),
// //               onPressed: () {
// //                 Navigator.push(context, MaterialPageRoute(builder: (context) =>page));
// //               },
// //               child: Text('Verify',
// //                 style: TextStyle(
// //                     color: Colors.white
// //                 ),),
// //             ),
// //             // ElevatedButton(
// //             //   style: ElevatedButton.styleFrom(
// //             //       backgroundColor: Colors.blue[900]
// //             //
// //             //   ),
// //             //   onPressed: () {
// //             //     Navigator.push(context, MaterialPageRoute(builder: (context) =>page));
// //             //   },
// //             //   child: Text('Know More',
// //             //     style: TextStyle(
// //             //         color: Colors.white
// //             //     ),),
// //             // ),
// //           ],
// //         )
// //       ),
// //     );
// //   }
// // }
//
// // OLD VERSION
// // ----------------------------------------------------
// // NEW VERSION
// import 'package:flutter/material.dart';
// import 'package:vanilla_app/features.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:vanilla_app/signup.dart';
//
// class MyIntro extends StatelessWidget {
//   int _selectedPage = 0;
//
//   final List<String> titles = [
//     'Scam Caller-ID Checker',
//     'Scam Website Checker',
//     'Scam Message Checker',
//     'Scam Email Checker',
//   ];
//
//   final List<String> subtitles = [
//     'Allow you to check for fraud Caller-ID',
//     'Allow you to check for fraud Website',
//     'Allow you to check for fraud Messages',
//     'Allow you to check for fraud Email',
//   ];
//
//   final List<Widget> pages = [
//     ScamCallerid(),
//     ScamWebsite(),
//     ScamText(),
//     ScamEmail(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Vanilla",
//                   style: TextStyle(
//                     fontSize: 25,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     IconButton(
//                       onPressed: () => _showPopup(context, ChatbotPopup()),
//                       color: Colors.white,
//                       icon: Icon(Icons.message),
//                     ),
//                     IconButton(
//                       onPressed: () => _showPopup(context, NotificationsPopup()),
//                       color: Colors.white,
//                       icon: Icon(Icons.notifications),
//                     ),
//                     IconButton(
//                       onPressed: () => _showPopup(context, ProfilePopup()),
//                       color: Colors.white,
//                       icon: Icon(Icons.account_circle_rounded),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(builder: (context) => AuthScreen()),
//                         );
//                       },
//                       icon: Icon(Icons.logout),
//                       color: Colors.white,
//                     ),
//                   ],
//                 )
//               ],
//             ),
//             SizedBox(height: 10),
//             TextField(
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 isDense: true,
//                 contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
//                 hintStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
//                 hintText: "Search",
//                 suffixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                   borderSide: const BorderSide(),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: titles.length,
//                 itemBuilder: (context, index) {
//                   return CustomTile(
//                     title: titles[index],
//                     subtitle: subtitles[index],
//                     page: pages[index],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(32),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage('https://imgs.search.brave.com/sfqVZvAxc_0V_vB1v-l7ljQaMeuWC5k1RRnVF_kbgc8/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzJkL2Zl/LzZjLzJkZmU2Yzk2/ZThjODFhNjkwZGQ1/NDczNDE0MjY1ZDlk/LmpwZw'),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showPopup(BuildContext context, Widget popup) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           backgroundColor: Colors.transparent,
//           child: popup,
//         );
//       },
//     );
//   }
// }
//
// class CustomTile extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final Widget page;
//
//   CustomTile({required this.title, required this.subtitle, required this.page});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(10),
//       color: Colors.black.withOpacity(0.3),
//       elevation: 5,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//         side: BorderSide(color: Colors.white),
//       ),
//       child: ListTile(
//         title: Text(title, style: TextStyle(color: Colors.white)),
//         subtitle: Text(subtitle, style: TextStyle(color: Colors.white)),
//         trailing: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue[900],
//           ),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => page),
//             );
//           },
//           child: Text('Verify', style: TextStyle(color: Colors.white)),
//         ),
//       ),
//     );
//   }
// }
//
// class ChatbotPopup extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       color: Colors.white,
//       child: Text("Chatbot Content"),
//     );
//   }
// }
//
// class NotificationsPopup extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       color: Colors.white,
//       child: Text("Notifications Content"),
//     );
//   }
// }
//
// class ProfilePopup extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       color: Colors.white,
//       child: Text("Profile Content"),
//     );
//   }
// }
// // --------------------------
// // try-2
// // import 'package:flutter/material.dart';
// // import 'package:vanilla_app/features.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:vanilla_app/signup.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// //
// // class MyIntro extends StatefulWidget {
// //   @override
// //   _MyIntroState createState() => _MyIntroState();
// // }
// //
// // class _MyIntroState extends State<MyIntro> {
// //   String selectedLanguage = "es"; // Default to Spanish
// //   bool isLoading = false;
// //
// //   List<String> originalTitles = [
// //     'Scam Caller-ID Checker',
// //     'Scam Website Checker',
// //     'Scam Message Checker',
// //     'Scam Email Checker',
// //   ];
// //
// //   List<String> originalSubtitles = [
// //     'Allow you to check for fraud Caller-ID',
// //     'Allow you to check for fraud Website',
// //     'Allow you to check for fraud Messages',
// //     'Allow you to check for fraud Email',
// //   ];
// //
// //   List<String> translatedTitles = [];
// //   List<String> translatedSubtitles = [];
// //
// //   final List<Widget> pages = [
// //     ScamCallerid(),
// //     ScamWebsite(),
// //     ScamText(),
// //     ScamEmail(),
// //   ];
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     translatedTitles = List.from(originalTitles);
// //     translatedSubtitles = List.from(originalSubtitles);
// //   }
// //
// //   Future<void> translateText() async {
// //     setState(() => isLoading = true);
// //
// //     List<Future<String>> titleTranslations = originalTitles.map((title) => translate(title, selectedLanguage)).toList();
// //     List<Future<String>> subtitleTranslations = originalSubtitles.map((subtitle) => translate(subtitle, selectedLanguage)).toList();
// //
// //     translatedTitles = await Future.wait(titleTranslations);
// //     translatedSubtitles = await Future.wait(subtitleTranslations);
// //
// //     setState(() => isLoading = false);
// //   }
// //
// //   Future<String> translate(String text, String lang) async {
// //     final response = await http.post(
// //       Uri.parse('https://libretranslate.com/translate'),
// //       headers: {"Content-Type": "application/json"},
// //       body: jsonEncode({
// //         "q": text,
// //         "source": "en",
// //         "target": lang,
// //         "format": "text",
// //       }),
// //     );
// //
// //     if (response.statusCode == 200) {
// //       return jsonDecode(response.body)["translatedText"];
// //     } else {
// //       return text; // Return original text in case of error
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         child: Column(
// //           children: [
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Text(
// //                   "Vanilla",
// //                   style: TextStyle(fontSize: 25, color: Colors.white),
// //                 ),
// //                 Row(
// //                   children: [
// //                     IconButton(
// //                       onPressed: () => _showPopup(context, ChatbotPopup()),
// //                       color: Colors.white,
// //                       icon: Icon(Icons.message),
// //                     ),
// //                     IconButton(
// //                       onPressed: () => _showPopup(context, NotificationsPopup()),
// //                       color: Colors.white,
// //                       icon: Icon(Icons.notifications),
// //                     ),
// //                     IconButton(
// //                       onPressed: () => _showPopup(context, ProfilePopup()),
// //                       color: Colors.white,
// //                       icon: Icon(Icons.account_circle_rounded),
// //                     ),
// //                     IconButton(
// //                       onPressed: () {
// //                         Navigator.pushReplacement(
// //                           context,
// //                           MaterialPageRoute(builder: (context) => AuthScreen()),
// //                         );
// //                       },
// //                       icon: Icon(Icons.logout),
// //                       color: Colors.white,
// //                     ),
// //                   ],
// //                 )
// //               ],
// //             ),
// //             SizedBox(height: 10),
// //             TextField(
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 isDense: true,
// //                 contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
// //                 hintStyle: TextStyle(color: Colors.black),
// //                 hintText: "Search",
// //                 suffixIcon: const Icon(Icons.search),
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(20.0),
// //                   borderSide: const BorderSide(),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             isLoading
// //                 ? CircularProgressIndicator()
// //                 : Expanded(
// //                     child: ListView.builder(
// //                       itemCount: translatedTitles.length,
// //                       itemBuilder: (context, index) {
// //                         return CustomTile(
// //                           title: translatedTitles[index],
// //                           subtitle: translatedSubtitles[index],
// //                           page: pages[index],
// //                         );
// //                       },
// //                     ),
// //                   ),
// //             DropdownButton<String>(
// //               value: selectedLanguage,
// //               dropdownColor: Colors.black,
// //               items: [
// //                 DropdownMenuItem(value: "es", child: Text("Spanish", style: TextStyle(color: Colors.white))),
// //                 DropdownMenuItem(value: "fr", child: Text("French", style: TextStyle(color: Colors.white))),
// //                 DropdownMenuItem(value: "de", child: Text("German", style: TextStyle(color: Colors.white))),
// //               ],
// //               onChanged: (String? newLang) {
// //                 if (newLang != null) {
// //                   setState(() => selectedLanguage = newLang);
// //                   translateText();
// //                 }
// //               },
// //             ),
// //           ],
// //         ),
// //         alignment: Alignment.center,
// //         padding: EdgeInsets.all(32),
// //         decoration: BoxDecoration(
// //           image: DecorationImage(
// //             image: NetworkImage('https://imgs.search.brave.com/sfqVZvAxc_0V_vB1v-l7ljQaMeuWC5k1RRnVF_kbgc8/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzJkL2Zl/LzZjLzJkZmU2Yzk2/ZThjODFhNjkwZGQ1/NDczNDE0MjY1ZDlk/LmpwZw'),
// //             fit: BoxFit.cover,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   void _showPopup(BuildContext context, Widget popup) {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return Dialog(
// //           backgroundColor: Colors.transparent,
// //           child: popup,
// //         );
// //       },
// //     );
// //   }
// // }
// // class ChatbotPopup extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: EdgeInsets.all(20),
// //       color: Colors.white,
// //       child: Text("Chatbot Content"),
// //     );
// //   }
// // }
// //
// // class NotificationsPopup extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: EdgeInsets.all(20),
// //       color: Colors.white,
// //       child: Text("Notifications Content"),
// //     );
// //   }
// // }
// //
// // class ProfilePopup extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: EdgeInsets.all(20),
// //       color: Colors.white,
// //       child: Text("Profile Content"),
// //     );
// //   }
// // }
// // --------------------------------------
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:vanilla_app/features.dart';
// // import 'package:vanilla_app/signup.dart';
// // import 'localization_service.dart';
// //
// // class MyIntro extends StatelessWidget {
// //   final List<String> featureKeys = [
// //     "scam_caller_id",
// //     "scam_website",
// //     "scam_message",
// //     "scam_email",
// //   ];
// //
// //   final List<String> subtitleKeys = [
// //     "check_caller_id",
// //     "check_website",
// //     "check_message",
// //     "check_email",
// //   ];
// //
// //   final List<Widget> pages = [
// //     ScamCallerid(),
// //     ScamWebsite(),
// //     ScamText(),
// //     ScamEmail(),
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     var langProvider = Provider.of<LanguageProvider>(context);
// //
// //     return Scaffold(
// //       body: Container(
// //         child: Column(
// //           children: [
// //             // 🔹 App Bar with Language Selector
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Text(
// //                   langProvider.t("app_name"),
// //                   style: TextStyle(fontSize: 25, color: Colors.white),
// //                 ),
// //                 Row(
// //                   children: [
// //                     _iconButton(context, Icons.message, ChatbotPopup()),
// //                     _iconButton(context, Icons.notifications, NotificationsPopup()),
// //                     _iconButton(context, Icons.account_circle_rounded, ProfilePopup()),
// //                     IconButton(
// //                       onPressed: () {
// //                         Navigator.pushReplacement(
// //                           context,
// //                           MaterialPageRoute(builder: (context) => AuthScreen()),
// //                         );
// //                       },
// //                       icon: Icon(Icons.logout),
// //                       color: Colors.white,
// //                     ),
// //                   ],
// //                 )
// //               ],
// //             ),
// //             SizedBox(height: 10),
// //
// //             // 🔹 Search Field
// //             TextField(
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 isDense: true,
// //                 contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
// //                 hintStyle: TextStyle(color: Colors.black),
// //                 hintText: langProvider.t("search"),
// //                 suffixIcon: Icon(Icons.search),
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(20.0),
// //                   borderSide: BorderSide(),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //
// //             // 🔹 List of Features
// //             Expanded(
// //               child: ListView.builder(
// //                 itemCount: featureKeys.length,
// //                 itemBuilder: (context, index) {
// //                   return CustomTile(
// //                     title: langProvider.t(featureKeys[index]),
// //                     subtitle: langProvider.t(subtitleKeys[index]),
// //                     page: pages[index],
// //                   );
// //                 },
// //               ),
// //             ),
// //
// //             // 🔹 Language Dropdown Selector
// //             DropdownButton<String>(
// //               value: langProvider.currentLanguage,
// //               items: [
// //                 DropdownMenuItem(value: "en", child: Text("English")),
// //                 DropdownMenuItem(value: "es", child: Text("Español")),
// //                 DropdownMenuItem(value: "fr", child: Text("Français")),
// //                 DropdownMenuItem(value: "de", child: Text("Deutsch")),
// //               ],
// //               onChanged: (String? newLang) async {
// //                 if (newLang != null) {
// //                   await langProvider.changeLanguage(newLang);
// //                 }
// //               },
// //             ),
// //           ],
// //         ),
// //         alignment: Alignment.center,
// //         padding: EdgeInsets.all(32),
// //         decoration: BoxDecoration(
// //           image: DecorationImage(
// //             image: NetworkImage('https://imgs.search.brave.com/sfqVZvAxc_0V_vB1v-l7ljQaMeuWC5k1RRnVF_kbgc8/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzJkL2Zl/LzZjLzJkZmU2Yzk2/ZThjODFhNjkwZGQ1/NDczNDE0MjY1ZDlk/LmpwZw'),
// //             fit: BoxFit.cover,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _iconButton(BuildContext context, IconData icon, Widget popup) {
// //     return IconButton(
// //       onPressed: () => _showPopup(context, popup),
// //       icon: Icon(icon, color: Colors.white),
// //     );
// //   }
// //
// //   void _showPopup(BuildContext context, Widget popup) {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return Dialog(
// //           backgroundColor: Colors.transparent,
// //           child: popup,
// //         );
// //       },
// //     );
// //   }
// // }
// //
// // class CustomTile extends StatelessWidget {
// //   final String title;
// //   final String subtitle;
// //   final Widget page;
// //
// //   CustomTile({required this.title, required this.subtitle, required this.page});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       margin: EdgeInsets.all(10),
// //       color: Colors.black.withOpacity(0.3),
// //       elevation: 5,
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(10),
// //         side: BorderSide(color: Colors.white),
// //       ),
// //       child: ListTile(
// //         title: Text(title, style: TextStyle(color: Colors.white)),
// //         subtitle: Text(subtitle, style: TextStyle(color: Colors.white)),
// //         trailing: ElevatedButton(
// //           style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
// //           onPressed: () {
// //             Navigator.push(context, MaterialPageRoute(builder: (context) => page));
// //           },
// //           child: Text('Verify', style: TextStyle(color: Colors.white)),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class ChatbotPopup extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: EdgeInsets.all(20),
// //       color: Colors.white,
// //       child: Text("Chatbot Content"),
// //     );
// //   }
// // }
// //
// // class NotificationsPopup extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: EdgeInsets.all(20),
// //       color: Colors.white,
// //       child: Text("Notifications Content"),
// //     );
// //   }
// // }
// //
// // class ProfilePopup extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: EdgeInsets.all(20),
// //       color: Colors.white,
// //       child: Text("Profile Content"),
// //     );
// //   }
// // }
