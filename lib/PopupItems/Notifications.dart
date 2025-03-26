// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const Notification1());
// }
//
// class Notification1 extends StatelessWidget {
//   const Notification1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: NotificationScreen(),
//     );
//   }
// }
//
// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({super.key});
//
//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }
//
// class _NotificationScreenState extends State<NotificationScreen> {
//   final List<String> dummyMessages = [
//     "You have a new message!",
//     "Reminder: Meeting at 3 PM",
//     "Battery low, charge your phone!",
//     "New friend request received!",
//     "Check out our latest updates!",
//   ];
//   final List<Map<String, String>> notifications = [];
//   final List<String> title = ['Notification For You', 'You have a Notification'];
//
//   void _showDummyNotification() {
//     final random = Random();
//     String message = dummyMessages[random.nextInt(dummyMessages.length)];
//
//     setState(() {
//       notifications.add({"title": title[random.nextInt(title.length)], "message": message});
//     });
//
//     // Auto-dismiss notification after 5 seconds
//     // Future.delayed(const Duration(seconds: 5), () {
//     //   if (notifications.isNotEmpty) {
//     //     setState(() {
//     //       notifications.removeAt(0);
//     //     });
//     //   }
//     // });
//   }
//
//
//   void _clearNotifications() {
//     setState(() {
//       notifications.clear();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Dummy Notifications")),
//       body: Stack(
//         children: [
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // ElevatedButton(
//                 //   onPressed: _showDummyNotification,
//                 //   child: const Text("Show Dummy Notification"),
//                 // ),
//                 // const SizedBox(height: 10),
//                 // ElevatedButton(
//                 //   onPressed: _scheduleDummyNotifications,
//                 //   child: const Text("Schedule Notifications"),
//                 // ),
//                 const SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: _clearNotifications,
//                   child: const Text("Clear Notifications"),
//                 ),
//               ],
//             ),
//           ),
//           // Notification pop-up UI
//           if (notifications.isNotEmpty)
//             Align(
//               alignment: Alignment.topCenter,
//               child: Column(
//                 children: notifications
//                     .map(
//                       (notif) => Container(
//                     margin: const EdgeInsets.only(top: 20),
//                     padding: const EdgeInsets.all(10),
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.2),
//                           blurRadius: 5,
//                         )
//                       ],
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 notif["title"]!,
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                               Text(
//                                 notif["message"]!,
//                                 style: const TextStyle(color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.close, color: Colors.white),
//                           onPressed: () {
//                             setState(() {
//                               notifications.remove(notif);
//                             });
//                           },
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//                     .toList(),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
// ----------------------------
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const Notification1());
}

class Notification1 extends StatelessWidget {
  const Notification1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<String> dummyMessages = [
    "You have a new message!",
    "Reminder: Meeting at 3 PM",
    "Battery low, charge your phone!",
    "New friend request received!",
    "Check out our latest updates!",
  ];
  final List<Map<String, String>> notifications = [];
  final List<String> title = ['Notification For You', 'You have a Notification'];

  void _showDummyNotification() {
    final random = Random();
    String message = dummyMessages[random.nextInt(dummyMessages.length)];
    String randomTitle = title[random.nextInt(title.length)];

    setState(() {
      notifications.add({"title": randomTitle, "message": message});
    });
  }

  void _clearNotifications() {
    setState(() {
      notifications.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dummy Notifications")),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _showDummyNotification,
                  child: const Text("Show Dummy Notification"),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _clearNotifications,
                  child: const Text("Clear Notifications"),
                ),
              ],
            ),
          ),
          // Fixed Notification Pop-up UI
          if (notifications.isNotEmpty)
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: notifications
                    .map(
                      (notif) => Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notif["title"]!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                notif["message"]!,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              notifications.remove(notif);
                            });
                          },
                        )
                      ],
                    ),
                  ),
                )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
