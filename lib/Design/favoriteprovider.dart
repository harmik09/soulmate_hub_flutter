import 'package:flutter/material.dart';
import 'itemmodel.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Item> _favorites = [];

  List<Item> get favorites => _favorites;

  void addFavorite(Item item) {
    if (!_favorites.contains(item)) {
      _favorites.add(item);
      notifyListeners();
    }
  }

  void removeFavorite(Item item) {
    _favorites.removeWhere((fav) => fav.id == item.id);
    notifyListeners();
  }

  bool isFavorite(Item item) {
    return _favorites.contains(item);
  }
}
