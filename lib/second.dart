import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:my_practice/widgets/customButton.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyhomeState();
  }
  
}

class MyhomeState extends State<MyHomePage> {  
  var count=0;

//CALCULATOR 
  var result='';
  var no1=TextEditingController(); //making controller for number 1.
  var no2=TextEditingController(); //making controller for number 2.
//
  var arrData=['Aryan','Kumar','Hari','Ram'];  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful'),

      ),
      body:
      // Container(
      //   child: ListView(
      //     children:arrData.map((value){
      //       return ListTile(
      //         leading: Icon(Icons.account_circle),
      //         title: Text(value),
      //       );

      //     }).toList(), //use map when widget has to be same with different
      //   ),
      // )
      //CALCULATOR
      // Container(
      //   color: const Color.fromARGB(255, 145, 180, 209),
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         TextField(
      //           keyboardType: TextInputType.number,
      //           decoration: InputDecoration(
      //             border: OutlineInputBorder(),
      //             hintText:'Enter 1st Number' ,
      //           ),
      //           controller: no1,
      //         ),
      //         SizedBox(height: 10,),
      //         TextField(
      //           keyboardType: TextInputType.number,
      //           decoration: InputDecoration(
      //             border: OutlineInputBorder(),
      //             hintText:'Enter 2nd Number' ,
                  
      //           ),
      //           controller: no2,
      //         ),
      //         SizedBox(height: 40,),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             ElevatedButton(onPressed: (){
      //               var n1=int.parse(no1.text.toString()); //COnverting Input inpot integer
      //               var n2=int.parse(no2.text.toString());
      //               var sum=n1+n2;
      //               result='Sum is $sum';
      //               setState(() {
                      
      //               });
                  
      //             }, child: Text('ADD')),
                  
      //             ElevatedButton(onPressed: (){
      //               var n1=int.parse(no1.text.toString()); //COnverting Input inpot integer
      //               var n2=int.parse(no2.text.toString());
      //               var sub=n1-n2;
      //               result='SUbtraction is is $sub';
      //               setState(() {
                      
      //               });
      //             }, child: Text('SUBTRACT')),
                  
      //             ElevatedButton(onPressed: (){
      //               var n1=int.parse(no1.text.toString()); //COnverting Input inpot integer
      //               var n2=int.parse(no2.text.toString());
      //               var mul=n1*n2;
      //               result='Multipy is $mul';
      //               setState(() {
                      
      //               });
      //             }, child: Text('MULTIPLY')),
                  
      //             ElevatedButton(onPressed: (){
      //               var n1=int.parse(no1.text.toString()); //COnverting Input inpot integer
      //               var n2=int.parse(no2.text.toString());
      //               var div=n1/n2;
      //               result='DIvison is $div';
      //               setState(() {
                      
      //               });
      //             }, child: Text('DIVIDE')),
      //             ],
      //         ),
      //         Padding(padding: EdgeInsets.all(21),
      //         child: Text(result,style: TextStyle(fontSize:40 ,color: Color.fromARGB(255, 0, 83, 226)),),)
      //       ],
      //       ),
      //   ),
      // )
      //CALCULATOE ENDS
       
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text('Count: $count'),
      //       ElevatedButton(onPressed: (){
              
      //         setState(() { //Used toshow changes in UI.
      //           count++;
      //         });

      //       }, child: Text('CLick!!')),
      //       Container(
      //         color: Colors.lightBlue ,
      //       ),

      //     ],
      //   ),
      // )
    
    );
  }
}
