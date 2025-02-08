import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'itemmodel.dart';
import 'favoriteprovider.dart';
import 'userdetails.dart';
import 'adduser.dart';
import 'favorite.dart';
import 'utils/colors.dart';
import 'MenuDrawer.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  UserListState createState() => UserListState();
}

class UserListState extends State<UserList> {
  final TextEditingController searchController = TextEditingController();
  List<Item> filteredUsers = users.map((user) => Item.fromMap(user)).toList();

  @override
  void initState() {
    super.initState();
    searchController.addListener(filterUsers);
  }

  void filterUsers() {
    setState(() {
      filteredUsers = users
          .map((user) => Item.fromMap(user))
          .where((user) =>
      user.fullName.toLowerCase().contains(searchController.text.toLowerCase()) ||
          user.email.toLowerCase().contains(searchController.text.toLowerCase()) ||
          user.city.toLowerCase().contains(searchController.text.toLowerCase()))
          .toList();
    });
  }

  void deleteUser(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Delete User"),
        content: Text("Are you sure you want to delete this user?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("No"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                users.removeAt(index);
                filteredUsers = users.map((user) => Item.fromMap(user)).toList();
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("User deleted successfully!")),
              );
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: THEMECOLOR,
        title: Text(
          "User List",
          style: TextStyle(color: TEXTCOLOR, fontWeight: FontWeight.bold),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.favorite, color: Colors.white),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => FavoritesPage()),
        //       );
        //     },
        //   )
        // ],
      ),
      drawer: MenuDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: "Search User",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Expanded(
            child: filteredUsers.isEmpty
                ? Center(child: Text("No users found."))
                : ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final user = filteredUsers[index];

                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetails(userData: user.toMap()),
                        ),
                      );
                    },
                    title: Text(user.fullName),
                    subtitle: Text("Mobile: ${user.mobile}\nCity: ${user.city}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            favoriteProvider.isFavorite(user) ? Icons.favorite : Icons.favorite_border,
                            color: favoriteProvider.isFavorite(user) ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              if (favoriteProvider.isFavorite(user)) {
                                favoriteProvider.removeFavorite(user);
                              } else {
                                favoriteProvider.addFavorite(user);
                              }
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteUser(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddUser(isEditing: false),
            ),
          );
          setState(() {
            filteredUsers = users.map((user) => Item.fromMap(user)).toList();
          });
        },
        backgroundColor: THEMECOLOR,
        child: Icon(Icons.add),
      ),
    );
  }
}
