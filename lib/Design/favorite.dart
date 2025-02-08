import 'package:flutter/material.dart';
import 'package:matrimony/Design/MenuDrawer.dart';
import 'package:matrimony/Design/utils/colors.dart';
import 'package:provider/provider.dart';
import 'favoriteprovider.dart';
import 'itemmodel.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: THEMECOLOR,
          title: Text(
            "Favorite",
            style: TextStyle(color: TEXTCOLOR, fontWeight: FontWeight.bold),
          )),
      drawer: MenuDrawer(),
      body: favoriteProvider.favorites.isEmpty
          ? Center(child: Text("No favorite users."))
          : ListView.builder(
              itemCount: favoriteProvider.favorites.length,
              itemBuilder: (context, index) {
                final user = favoriteProvider.favorites[index];
                return ListTile(
                  title: Text(user.fullName),
                  subtitle: Text(user.email),
                  trailing: IconButton(
                    icon: Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {
                      favoriteProvider.removeFavorite(user);
                    },
                  ),
                );
              },
            ),
    );
  }
}
