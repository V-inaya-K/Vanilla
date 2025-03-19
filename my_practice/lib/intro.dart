import 'package:flutter/material.dart';
import 'package:my_practice/features/features.dart';
import 'package:flutter/cupertino.dart';
class MyIntro extends StatelessWidget {
  int _selectedPage = 0;

  // Sample data arrays for titles and subtitles
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
    ScamCallerid(), // Replace with your actual page widgets
    ScamWebsite(),
    ScamText(),
    ScamEmail(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(_selectedPage == 0
      //           ? CupertinoIcons.house_fill
      //           : CupertinoIcons.house),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(_selectedPage == 1
      //           ? CupertinoIcons.square_grid_2x2_fill
      //           : CupertinoIcons.square_grid_2x2),
      //       label: "Category",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(_selectedPage == 2
      //           ? CupertinoIcons.cart_fill
      //           : CupertinoIcons.cart),
      //       label: "Cart",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(_selectedPage == 3
      //           ? CupertinoIcons.person_fill
      //           : CupertinoIcons.person),
      //       label: "Profile",
      //     ),
      //
      //   ],
      // ),
      
      body: Container(
        
        child: Column(
          
          children: [
            Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vanilla",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      color: Colors.white,
                      icon: Icon(Icons.message),
                    ),
                    IconButton(
                      onPressed: () {},
                      color: Colors.white,
                      icon: Icon(Icons.notifications),
                    ),
                    IconButton(
                      onPressed: () {},
                      color: Colors.white,
                      icon: Icon(Icons.account_circle_rounded),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                hintStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                hintText: "Search",
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: titles.length, // Number of items in the list
                itemBuilder: (context, index) {
                  return CustomTile(
                    
                    title: titles[index],
                    subtitle: subtitles[index],
                    page: pages[index],
                  );
                },
              ),
            ),
          ],
        ),
        
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://imgs.search.brave.com/EFXyqZ-WmpA2KeniUmPNZnIvskZMLvIHv80NQ9Bv8hg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTE0/NTM1MDQ1Ny92ZWN0/b3IvYWJzdHJhY3Qt/bWVjaGFuaWNhbC1i/YWNrZ3JvdW5kLmpw/Zz9zPTYxMng2MTIm/dz0wJms9MjAmYz1W/Y3NvM0hEQ0hkeXd2/dWsxMEZQT2hwWXVq/eFBYQ25nMlZ5ckhq/RDhxSFFjPQ'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget page;


  CustomTile({required this.title, required this.subtitle,required this.page});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Colors.black.withOpacity(0.3),
      elevation: 5, // Add elevation for shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Optional: round the corners
        side: BorderSide(color: Colors.white)
      ),
      child: ListTile(
        title: Text(title,
        style: TextStyle(
          color: Colors.white
        )
        ),
        subtitle: Text(subtitle,
        style: TextStyle(
          color: Colors.white),
        ),
        trailing: Column(

          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900]

              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>page));
              },
              child: Text('Verify',
                style: TextStyle(
                    color: Colors.white
                ),),
            ),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.blue[900]
            //
            //   ),
            //   onPressed: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) =>page));
            //   },
            //   child: Text('Know More',
            //     style: TextStyle(
            //         color: Colors.white
            //     ),),
            // ),
          ],
        )
      ),
    );
  }
}