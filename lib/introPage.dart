import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  final List<String> items = List.generate(20, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              // Navigate to the second page and pass the selected item
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(item: items[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String item;

  SecondPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You selected:'),
            Text(
              item,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the first page
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}