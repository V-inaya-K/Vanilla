import 'package:flutter/cupertino.dart';
import 'package:vanilla_app/intro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translator/translator.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  final Widget? nextScreen;

  const SplashScreen({super.key, this.nextScreen});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Lottie.asset('assets/success.json'), // Update path if needed
      ),
      nextScreen: nextScreen ?? const Login(),
      duration: 1000,
      backgroundColor: Colors.black,
      splashIconSize: 500,
    );
  }
}


class Login extends StatefulWidget {
  const Login({super.key});


  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isSignup = true;
  void onSubmit() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SplashScreen(nextScreen: MyIntro(
          // name: nameController.text,
          // email: emailController.text,
          // password: passwordController.text,
        )),
      ),
    );
  }




  // Toggle state for Signup/Login
  // final translator = GoogleTranslator();
  // String _selectedLanguage = 'English';
  //
  // List<String> placeHolder = ["Enter Name", "Enter Email", "Enter Password"];
  // List<String> titles = ["Signup", "Login"];
  // List<String> subtitles = ["Already have an account? Login","Don't have an account? Sign Up"];
  // void _translateTexts() async {
  //   for (int i = 0; i < titles.length; i++) {
  //     var translatedTitle = await translator.translate(titles[i], to: _selectedLanguage.substring(0, 2).toLowerCase());
  //     var translatedSubtitle = await translator.translate(subtitles[i], to: _selectedLanguage.substring(0, 2).toLowerCase());
  //     var translatedButton = await translator.translate(placeHolder[i], to: _selectedLanguage.substring(0, 2).toLowerCase());
  //     setState(() {
  //       titles[i] = translatedTitle.text;
  //       subtitles[i] = translatedSubtitle.text;
  //       placeHolder[i] = translatedButton.text;
  //     });
  //   }
  // }

  final List<String> languages = ['English', 'Tamil', 'Hindi'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(left: 40, right: 40),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(isSignup ? 'signup.jpg' : 'login.jpg', width: 200, height: 200),
              // DropdownButton<String>(
              //   value: _selectedLanguage,
              //   dropdownColor: Colors.black,
              //   icon: Icon(Icons.language, color: Colors.white),
              //   onChanged: (String? newValue) {
              //     setState(() {
              //       _selectedLanguage = newValue!;
              //       _translateTexts();
              //     });
              //   },
              //   items: languages.map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value, style: TextStyle(color: Colors.white)),
              //     );
              //   }).toList(),
              // ),
              Text(
                isSignup ? "Signup" : "Login", // Toggle Text
                style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 500,
                child: Column(
                  children: [
                    if (isSignup) // Show Name field only for Signup
                      Column(
                        children: [
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: "Enter Name",
                              // hintText: placeHolder[0],
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                borderSide: BorderSide(width: 1, color: Colors.greenAccent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(width: 1, color: Colors.blueAccent),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        // hintText: placeHolder[1],
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          borderSide: BorderSide(width: 1, color: Colors.greenAccent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(width: 1, color: Colors.blueAccent),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        // hintText: placeHolder[2],
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          borderSide: BorderSide(width: 1, color: Colors.greenAccent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(width: 1, color: Colors.blueAccent),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Social Media Login Buttons in Column
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
                              padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                              foregroundColor: MaterialStateProperty.all(Colors.black),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: BorderSide(color: Colors.black54),
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('Google.webp', width: 30, height: 30),
                                SizedBox(width: 8),
                                Text("With Google", style: GoogleFonts.poppins(fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
                              padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                              foregroundColor: MaterialStateProperty.all(Colors.black),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: BorderSide(color: Colors.black54),
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('facebook.jpeg', width: 30, height: 30),
                                SizedBox(width: 8),
                                Text("With Facebook", style: GoogleFonts.poppins(fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Submit Button
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: onSubmit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          isSignup ? "Signup" : "Login",
                          style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),

                    // Switch between Signup and Login
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isSignup = !isSignup; // Toggle state
                        });
                      },
                      child: Text(
                        isSignup ? "Already have an account? Login" : "Don't have an account? Sign Up",
                        // isSignup ? subtitles[0] : subtitles[1],
                        style: GoogleFonts.poppins(fontSize: 14, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
