// import 'package:flutter/material.dart';
//
// class MyGoals extends StatefulWidget {
//   const MyGoals({super.key});
//
//   @override
//   State<MyGoals> createState() => _MyGoalsState();
// }
//
// class _MyGoalsState extends State<MyGoals> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(child: Column(
//         children: [
//           Image.asset('assets/animations/op90.png')
//         ],
//       )),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.house,
//               color: Colors.black,),
//             label: 'Home',),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.folder_copy_outlined,
//                 color: Colors.blue,),
//
//               label: 'MyGoals'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.person_off_outlined,
//                 color: Colors.black,),
//               label: 'Profile'),
//
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(''),

          )
        ),
        child: Column(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(
                      CupertinoIcons.profile_circled,
                      size: 100
                      ,
                    ),
                    radius: 50,
                    backgroundImage: NetworkImage(''), // Replace with your image URL
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Harihar Pal',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'palharihar@gmail.com',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.auto_graph,),
                      Text('3'),
                      Icon(Icons.auto_graph,
                        color: Colors.green,),
                      Text('3'),



                    ],
                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(

                      children: [
                        Icon(Icons.edit),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(20)
                          ),

                          onPressed: () {
                            // Add your action here
                          },
                          child: Text('Edit Profile',style:
                            TextStyle(
                              color: Colors.black
                            ),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.account_balance),
                        TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.all(20)
                            ),
                            onPressed: (){},
                            child: Text('Transactions',
                            style: TextStyle(
                              color: Colors.black
                            ),))

                      ],
                    ),
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