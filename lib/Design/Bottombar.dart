// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:matrimony/Design/userlist.dart';
// import 'package:matrimony/Design/utils/colors.dart';
// import 'aboutus.dart';
// import 'adduser.dart';
// import 'dashboard.dart';
// import 'favorite.dart';
//
// class Bottombar extends StatefulWidget {
//   @override
//   _BottombarState createState() => _BottombarState();
// }
//
// class _BottombarState extends State<Bottombar> {
//   int _currentIndex = 0; // Tracks the selected tab index
//
//   // List of pages corresponding to the tabs
//   final List<Widget> _pages = [
//     Dashboard(),
//     AddUser(),
//     UserList(),
//     // Favorite(favoriteUsers: [],),
//     Aboutus(),
//   ];
//
//   // List of BottomNavigationBar items
//   final List<Map<String, dynamic>> _menu = [
//     {"icon": Icons.person_add, "label": "Add User"},
//     {"icon": Icons.list_alt, "label": "User List"},
//     {"icon": Icons.favorite, "label": "Favorite"},
//     {"icon": Icons.account_circle, "label": "About Us"},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_currentIndex], // Display the selected page
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index; // Update the selected index
//           });
//         },
//         selectedItemColor: THEMECOLOR,
//         unselectedItemColor: Colors.grey,
//         items: _menu
//             .map((item) => BottomNavigationBarItem(
//           icon: Icon(item["icon"]),
//           label: item["label"],
//         ))
//             .toList(),
//       ),
//     );
//   }
// }
