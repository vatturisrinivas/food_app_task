import 'package:flutter/foundation.dart';

import 'Models/meals_model.dart';

class Cart with ChangeNotifier {
  List<Meal> _cartItems = [];

  List<Meal> get cartItems => _cartItems;

  void addToCart(Meal meal) {
    _cartItems.add(meal);
    notifyListeners();
  }

  void removeFromCart(Meal meal) {
    _cartItems.remove(meal);
    notifyListeners();
  }
}
