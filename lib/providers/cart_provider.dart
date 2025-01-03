import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  // Ajouter un article au panier
  void addItem(CartItem item) {
    final index = _cartItems.indexWhere(
        (existingItem) => existingItem.flavorName == item.flavorName);
    if (index >= 0) {
      _cartItems[index].quantity +=
          1; // Si l'item existe déjà, on augmente la quantité
    } else {
      _cartItems.add(item); // Sinon, on ajoute le nouvel article
    }
    notifyListeners();
  }

  // Supprimer un article du panier
  void removeItem(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  // Vider le panier
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  //Modifier la quantité
  void updateQuantity(CartItem item, int change) {
    final index = cartItems.indexOf(item);
    if (index >= 0) {
      cartItems[index].quantity += change;
      if (cartItems[index].quantity <= 0) {
        removeItem(item);
      } else {
        notifyListeners();
      }
    }
  }

  // Calculer le prix total pour l'item
  double calculateTotalPrice(CartItem item) {
    return item.quantity * item.price.roundToDouble();
  }

  // Calculer le prix total pour la totalité du panier
  double get totalAmount {
    return cartItems.fold(
      0.0,
      (sum, item) => sum + (item.quantity * item.price),
    );
  }
}
