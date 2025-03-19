// // import 'package:flutter/material.dart';
// // import 'package:lottie/lottie.dart';
// // import 'package:animated_splash_screen/animated_splash_screen.dart';
// // import 'package:vanilla_app/intro.dart';
// //
// // void main() {
// //   runApp(MaterialApp(home: SplashScreen()));
// // }
// //
// // class SplashScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return AnimatedSplashScreen(
// //       splash: Center(
// //         child: Lottie.asset(
// //             'success.json'
// //         ),
// //
// //       ),
// //       // nextScreen:  MyIntro(),
// //       // nextScreen: MyIntro(),
// //       nextScreen: MyIntro(),
// //
// //       duration: 600,
// //       backgroundColor: const Color.fromARGB(255, 0, 0, 0),
// //       splashIconSize: 500,
// //     );
// //
// //   }
// // }
// //
// // class AuthScreen extends StatefulWidget {
// //   @override
// //   _AuthScreenState createState() => _AuthScreenState();
// // }
// //
// // class _AuthScreenState extends State<AuthScreen> {
// //   bool isLogin = true;
// //
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //
// //   void toggleAuthMode() {
// //     setState(() {
// //       isLogin = !isLogin;
// //     });
// //   }
// //
// //   void handleSubmit() {
// //     final email = emailController.text;
// //     final password = passwordController.text;
// //     print(isLogin ? 'Logging in with $email' : 'Signing up with $email');
// //
// //     Navigator.pushReplacement(
// //       context,
// //       MaterialPageRoute(builder: (context) => SplashScreen()),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text(isLogin ? 'Login' : 'Sign Up')),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             TextField(
// //               controller: emailController,
// //               decoration: InputDecoration(labelText: 'Email'),
// //             ),
// //             TextField(
// //               controller: passwordController,
// //               decoration: InputDecoration(labelText: 'Password'),
// //               obscureText: true,
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: handleSubmit,
// //               child: Text(isLogin ? 'Login' : 'Sign Up'),
// //             ),
// //             TextButton(
// //               onPressed: toggleAuthMode,
// //               child: Text(isLogin ? 'Create an account' : 'Already have an account? Login'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // ---------------------
// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:vanilla_app/intro.dart';
//
// void main() {
//   runApp(MaterialApp(home: SplashScreen()));
// }
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       splash: Center(
//         child: Lottie.asset(
//           'success.json', // JSON file path
//         ),
//       ),
//       nextScreen: MyIntro(),
//       duration: 600,
//       backgroundColor: const Color.fromARGB(255, 0, 0, 0),
//       splashIconSize: 500,
//     );
//   }
// }
//
// class AuthScreen extends StatefulWidget {
//   @override
//   _AuthScreenState createState() => _AuthScreenState();
// }
//
// class _AuthScreenState extends State<AuthScreen> {
//   bool isLogin = true;
//
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   void toggleAuthMode() {
//     setState(() {
//       isLogin = !isLogin;
//     });
//   }
//
//   void handleSubmit() {
//     final email = emailController.text;
//     final password = passwordController.text;
//     print(isLogin ? 'Logging in with $email' : 'Signing up with $email');
//
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => SplashScreen()),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // decoration: BoxDecoration(
//       //   image: DecorationImage(
//       //     image: NetworkImage('https://imgs.search.brave.com/EFXyqZ-WmpA2KeniUmPNZnIvskZMLvIHv80NQ9Bv8hg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTE0/NTM1MDQ1Ny92ZWN0/b3IvYWJzdHJhY3Qt/bWVjaGFuaWNhbC1i/YWNrZ3JvdW5kLmpw/Zz9zPTYxMng2MTIm/dz0wJms9MjAmYz1W/Y3NvM0hEQ0hkeXd2/dWsxMEZQT2hwWXVq/eFBYQ25nMlZ5ckhq/RDhxSFFjPQ'),
//       //     fit: BoxFit.cover,
//       //   ),
//       // ),
//       body: Container(
//         // decoration: BoxDecoration(
//         //   image: DecorationImage(
//         //     image: NetworkImage('https://img.freepik.com/free-photo/abstract-textured-backgound_1258-30506.jpg?t=st=1742216660~exp=1742220260~hmac=0b22ba0d8f09af4402259cd6068c445d9929aedc5c5681334ad5163ab40687ef&w=740'),
//         //     fit: BoxFit.cover,
//         //   ),
//         // ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 isLogin ? 'Hi, Welcome Back! 👋' : 'Create an account',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               if (!isLogin)
//                 TextField(
//                   decoration: InputDecoration(labelText: 'Username'),
//                 ),
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//               ),
//               if (!isLogin)
//                 TextField(
//                   decoration: InputDecoration(labelText: 'Phone Number'),
//                 ),
//               TextField(
//                 controller: passwordController,
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//               ),
//               Row(
//                 children: [
//                   if (isLogin) Checkbox(value: true, onChanged: (_) {}),
//                   if (isLogin) Text("Remember Me"),
//                   Spacer(),
//                   if (isLogin) Text("Forgot Password?", style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: handleSubmit,
//                 child: Text(isLogin ? 'Login' : 'Sign Up'),
//               ),
//               Text("Or With"),
//               ElevatedButton.icon(
//                 onPressed: () {},
//                 icon: Icon(Icons.facebook),
//                 label: Text(isLogin ? 'Login with Facebook' : 'Signup with Facebook'),
//               ),
//               ElevatedButton.icon(
//                 onPressed: () {},
//                 icon: Icon(Icons.g_mobiledata),
//                 label: Text(isLogin ? 'Login with Google' : 'Signup with Google'),
//               ),
//               TextButton(
//                 onPressed: toggleAuthMode,
//                 child: Text(
//                   isLogin
//                       ? "Don't have an account? Sign Up"
//                       : "Already have an account? Login",
//                 ),
//               ),
//             ],
//
//           ),
//         ),
//         decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage('https://imgs.search.brave.com/bXfdZu9rrTLheoHrEalbyL1MghYonJFrq1AA2sLRixg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTE2/NDM0MTAwOC92ZWN0/b3IvYWJzdHJhY3Qt/Ymx1ZS10ZWNobm9s/b2d5LWNoZWNrLXBh/dHRlcm4tYmFja2dy/b3VuZC5qcGc_cz02/MTJ4NjEyJnc9MCZr/PTIwJmM9TW5zYU9N/SEQ1OTYxRlh5Rzdx/TmxBb0pNZkc3dndf/cVhPdkFDMXRQMGlC/az0'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//       ),
//     );
//   }
// }
// OLD VERSION
// -----------------------------------

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vanilla_app/intro.dart';

void main() {
  runApp(MaterialApp(home: SplashScreen()));
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Lottie.asset(
          'success.json', // JSON file path
        ),
      ),
      nextScreen: MyIntro(),
      duration: 600,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      splashIconSize: 500,
    );
  }
}

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void toggleAuthMode() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  void handleSubmit() {
    final email = emailController.text;
    final password = passwordController.text;
    print(isLogin ? 'Logging in with $email' : 'Signing up with $email');

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SplashScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://imgs.search.brave.com/bXfdZu9rrTLheoHrEalbyL1MghYonJFrq1AA2sLRixg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTE2/NDM0MTAwOC92ZWN0/b3IvYWJzdHJhY3Qt/Ymx1ZS10ZWNobm9s/b2d5LWNoZWNrLXBh/dHRlcm4tYmFja2dy/b3VuZC5qcGc_cz02/MTJ4NjEyJnc9MCZr/PTIwJmM9TW5zYU9N/SEQ1OTYxRlh5Rzdx/TmxBb0pNZkc3dndf/cVhPdkFDMXRQMGlC/az0'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Card(
            color: Colors.white.withOpacity(0.9),
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isLogin ? 'Hi, Welcome Back!' : 'Create an account',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  if (!isLogin)
                    TextField(
                      decoration: InputDecoration(labelText: 'Username'),
                    ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  if (!isLogin)
                    TextField(
                      decoration: InputDecoration(labelText: 'Phone Number'),
                    ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  Row(
                    children: [
                      if (isLogin) Checkbox(value: true, onChanged: (_) {}),
                      if (isLogin) Text("Remember Me"),
                      Spacer(),
                      if (isLogin) Text("Forgot Password?", style: TextStyle(color: Colors.red)),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: handleSubmit,
                    icon: Icon(Icons.arrow_forward,color: Colors.yellow[300]),
                    label: Text(isLogin ? 'Login' : 'Signup' , style: TextStyle(color: Colors.white)),
                  ),
                  // ElevatedButton(
                  //
                  //   onPressed: handleSubmit,
                  //   child: Text(isLogin ? 'Login' : 'Sign Up', style: TextStyle(color: Colors.white)),
                  //
                  // ),
                  SizedBox(height: 10),
                  Text("Or With"),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(

                      backgroundColor: Colors.blue[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.facebook, color: Colors.red),
                    label: Text(isLogin ? 'Login with Facebook' : 'Signup with Facebook', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.g_mobiledata,color: Colors.red),
                    label: Text(isLogin ? 'Login with Google' : 'Signup with Google' , style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: toggleAuthMode,
                    child: Text(
                      isLogin
                          ? "Don't have an account? Sign Up"
                          : "Already have an account? Login",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
