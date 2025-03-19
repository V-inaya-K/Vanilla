// import 'dart:math';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:my_practice/introPage.dart';
// import 'package:my_practice/splashScreen.dart';
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
//       // home: Splashscreen(),
//     );
//   }
// }

// class BmiPage extends StatefulWidget {
//   const BmiPage
// ({super.key, required this.title});
  

//   final String title;

//   @override
//   State<BmiPage
// > createState() => _BmiPage
// State();
// }

// // class _BmiPageState extends State<BmiPage> {
  
  

//   var wtCont=TextEditingController();
//   var ftCont=TextEditingController();
//   var inCont=TextEditingController();
//   var result="";
//   var bgColor=Colors.blueGrey;

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       //   title: Text(widget.title),
//       // ),
//       body:Container(
//         color: bgColor,
//         width: double.infinity,
        
//         height: double.infinity,
//         // decoration: BoxDecoration(
//         //   image: DecorationImage(image: new NetworkImage("https://www.freepik.com/free-photos-vectors/fitness-background"),
//         //   fit: BoxFit.cover)
//         // ),
        
//         child: Center(
//           child: Container(
//             // color: Colors.white,
//             decoration:BoxDecoration(
//               boxShadow: [BoxShadow(color: Colors.black,spreadRadius: 1.5,blurRadius:1.5)],
//               border: Border.all(color:Colors.black,width:1),
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(11),
//               //color: Colors.white,
              
//             ),
//             //color: Colors.white,
//             height: 400,
//             width: 400,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('BMI Calculator',style: TextStyle(
//                     fontSize: 25,
//                     fontFamily:'Sans-Serif',
//                   ),),
//                   SizedBox(height: 10,),
//                   TextField(
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.align_horizontal_left),
//                       border: OutlineInputBorder(),
//                       labelText: 'Enter Weight'
//                     ),controller: wtCont,

//                   ),
//                   SizedBox(height: 10,),
//                   TextField(
//                     keyboardType: TextInputType.numberWithOptions(
//                       decimal: true,
//                       signed: false,

//                     ),
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.align_horizontal_left),
//                       border: OutlineInputBorder(),

//                       labelText: 'Enter Hight in foot'
//                     ),controller: ftCont,

//                   ),
//                   SizedBox(height: 10,),
//                   // TextField(
//                   //   decoration: InputDecoration(
//                   //     prefixIcon: Icon(Icons.align_horizontal_left),
//                   //     border: OutlineInputBorder(),

//                   //     labelText: 'Enter Height in inches'
//                   //   ),controller: inCont,

//                   // ),
//                   SizedBox(height: 20,),
//                   ElevatedButton(onPressed: (){
//                     var wt=wtCont.text.toString();
//                     var ft=ftCont.text.toString();
//                     //var inch=inCont.text.toString();

//                     // if(wt!="" && ft!="" && inch!=""){
//                     if(wt!="" && ft!=""){
//                       var tWt=double.parse(wt);  //double used to take input in int as well as decimal.
//                       var ift=double.parse(ft); //double used to take input in int as well as decimal.
//                       // var iInch=int.parse(inch);
//                       // var tInch=(ift*12)+iInch;
//                       var tM=ift/3.281;
//                       var bmi=tWt/(tM*tM);
//                       setState(() {
//                         if(bmi>18.7 && bmi<24.9){
//                           result="Bravo,You have an awesome BMI.\nIt is ${bmi.toStringAsFixed(2)}";
//                           bgColor=Colors.lightGreen;
//                         }else{
//                           result="Your BMI is: ${bmi.toStringAsFixed(2)}\nWhich isn't so Pleasing!!";
//                           bgColor=Colors.red;
//                         }
                        
                        
//                       });

                      

//                     }else{
//                       setState(() {
//                         result="Please fill all deatils";
//                       });

//                     }
//                     ;


//                   }, child: Text('Check')),
//                   SizedBox(height: 20,),
//                   Text(result,style: TextStyle(fontSize: 15),)

//                 ],),
//             ),
//           ),
//         ),
//       )
//     );
//   }
// }
