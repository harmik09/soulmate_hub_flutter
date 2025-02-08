import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrimony/Design/fav.dart';
import 'package:matrimony/Design/userlist.dart';
import 'package:matrimony/Design/utils/colors.dart';
import 'aboutus.dart';
import 'adduser.dart';
import 'dashboard.dart';
import 'favorite.dart';

class MenuDrawer extends StatelessWidget{
  // Favorite favorite=new Favorite();
  final List<Map<String, dynamic>> menu = [
    {"icon": Icons.home, "text": "Home"},
    {"icon": Icons.person_add, "text": "Add User"},
    {"icon": Icons.list_alt, "text": "User List"},
    {"icon": Icons.favorite, "text": "Favorite"},
    {"icon": Icons.account_circle, "text": "About Us"},
  ];  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(menu[index]["icon"], color: THEMECOLOR),
            title: Text(menu[index]["text"]),
            onTap: () {
              if (index == 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ));
              }
              else if (index == 1) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddUser(),
                    ));
              } else if (index == 2) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserList(),
                    ));
              }
              else if (index == 3) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoritesPage(),
                    ));
              }
              else if (index == 4) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Aboutus(),
                    ));
              }
            },
          );
        },
      ),
    );
  }

}