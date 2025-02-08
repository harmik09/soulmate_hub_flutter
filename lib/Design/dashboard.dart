import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrimony/Design/aboutus.dart';
import 'package:matrimony/Design/adduser.dart';
import 'package:matrimony/Design/favorite.dart'; // Import correct file for Favorite
import 'package:matrimony/Design/userlist.dart';
import 'fav.dart';
import 'package:matrimony/Design/utils/colors.dart';

class Dashboard extends StatelessWidget {
  List<Map<String, dynamic>> menu = [
    {"icon": Icons.person_add_outlined, "text": "Add User"},
    {"icon": Icons.list_alt_rounded, "text": "User List"},
    {"icon": Icons.favorite_border, "text": "Favorite"},
    {"icon": Icons.account_circle_outlined, "text": "About Us"},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: THEMECOLOR,
          title: Text(
            'Welcome Soulmate Hub',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: GridView.builder(
          itemCount: menu.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  if (index == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddUser(),
                        ));
                  } else if (index == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserList(),
                        ));
                  } else if (index == 2) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoritesPage(), // Pass an empty list or actual data
                        ));
                  } else if (index == 3) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Aboutus(),
                        ));
                  }
                },
                child: Card(
                  elevation: 5,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        menu[index]['icon'],
                        size: 50,
                        color: THEMECOLOR,
                      ),
                      SizedBox(height: 10),
                      Text(
                        menu[index]['text'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
