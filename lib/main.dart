// import 'dart:math';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:my_practice/widgets/customButton.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   callback(){
//     print('Clicked');
//   }

//   @override
//   Widget build(BuildContext context) {
//     var arrColor=[Colors.red,Colors.blue,Colors.green,Colors.grey,Colors.amber];
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body:Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: Colors.grey,
//         child: Stack(
//           children: [
//             Positioned(
//               right: 10,
//               bottom: 10,
//               left: 10,

//               child: Container(
//                 color: Colors.white,
//                 width: 200,
//                 height: 200,
//               ),
//             )
//           ],
//         ),
//       )

//       // Container(
//       //   width:double.infinity,
//       //   child: Wrap(
//       //     direction: Axis.horizontal,
//       //     alignment: WrapAlignment.spaceBetween,
//       //     spacing: 11,
//       //     runSpacing: 11,
//       //     children: [
//       //       Container(
//       //         width: 200,
//       //         height: 200,
//       //         color: Colors.blue,
//       //       ),
//       //       Container(
//       //         width: 200,
//       //         height: 200,
//       //         color: Colors.green,
//       //       ),
//       //       Container(
//       //         width: 200,
//       //         height: 200,
//       //         color: Colors.red,
//       //       ),
//       //       Container(
//       //         width: 200,
//       //         height: 200,
//       //         color: Colors.purple,
//       //       ),
//       //     ],
//       //   ),
//       // )
//       // Stack(
//       //   children: [
//       //     Container(
//       //       width: 100,
//       //       height: 100,
//       //       color: Colors.amber,
//       //     ),
//       //     Container(
//       //       width: 80,
//       //       height: 80,
//       //       color: Colors.green,
//       //     )
//       //   ],
//       // )

//       // customButton(btnname: "Vinayak" ,
//       // icon: Icon(Icons.star),
//       // callback: () {
//       //   print('HI');
//       // },


//       // )
//       // ElevatedButton(
//       //   child:Text('Click') ,
//       //   onPressed: (){

//       //   },)




//       // GridView.builder(itemBuilder: (context, index) {
//       //   return(Container(color: arrColor[index]));
//       // },itemCount: arrColor.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       //   crossAxisCount: 4,
//       //   mainAxisSpacing: 11,
//       //   crossAxisSpacing: 11),)


//       // Column(
//       //   children: <Widget>[
//           // Expanded(
//           //   child:GridView.count(crossAxisCount: 3,

//           // crossAxisSpacing: 11,
//           // mainAxisSpacing: 11,
//           // children: [
//           //   Container(color: Colors.red,),
//           //   Container(color: Colors.blue,),
//           //   Container(color: Colors.green,),
//           //   Container(color: Colors.amber,),
//           //   Container(color: Colors.purple,),
//           //   Container(color: Colors.lightBlue,),


//           // ],
//           // ),
//           //   ),
//       //     Expanded(
//       //       child:Container(
//       //         height: 300,
//       //         child: GridView.extent(maxCrossAxisExtent: 90,

//       //         crossAxisSpacing: 11,
//       //         mainAxisSpacing: 11,
//       //         children: [
//       //         Container(color: Colors.red,),
//       //         Container(color: Colors.blue,),
//       //         Container(color: Colors.green,),
//       //         Container(color: Colors.amber,),
//       //         Container(color: Colors.purple,),
//       //         Container(color: Colors.lightBlue,),


//       //                   ],

//       //         ),
//       //       )


//       //     )

//       //     // SizedBox()
//       //   ],
//       // ) // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// class profile extends StatelessWidget{ //Declaring customized Widget.
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//         child: Text('Click me') ,
//         onPressed: (){

//           AlertDialog(
//             title: Text('HI'),
//           );
//         },);
//   }

// }


//------------------------------------------------------------------------


// main.dart
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Verify Scams',
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Verify Scams'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to scam text message checker
//               },
//               child: Text('Scam Text Message Checker'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to scam website checker
//               },
//               child: Text('Scam Website Checker'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to scam phone number checker
//               },
//               child: Text('Scam Phone Number Checker'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


//-----------------------------------------------------------------


// main.dart
//
// import 'package:flutter/material.dart';
// import 'package:my_practice/bmi.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Beautiful Background App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const BmiPage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Beautiful background
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color(0xFF2196F3),
//                   Color(0xFF03A9F4),
//                   Color(0xFF00BCD4),
//                 ],
//                 stops: [0.0, 0.5, 1.0],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//           ),
//           // 4 buttons
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: const Text('Button 1'),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: const Text('Button 2'),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: const Text('Button 3'),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),),);
//                   },
//                   child: const Text('Button 4'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



//--------------------------------------------


import 'package:flutter/material.dart';
import 'package:my_practice/features/features_greeno.dart';
import 'package:my_practice/home_veshack.dart';
import 'package:my_practice/intro.dart';
import 'package:my_practice/introPage.dart';
import 'package:my_practice/splash.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: SplashScreen1(),
      home: MyIntro(),
    );
  }
}
