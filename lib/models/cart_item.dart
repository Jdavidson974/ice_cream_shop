class CartItem {
  final String flavorName;
  final String imagePath;
  final int price;
  int quantity;

  CartItem({
    required this.flavorName,
    required this.imagePath,
    required this.price,
    this.quantity = 1,
  });

  // Méthode pour calculer le prix total pour cet item
  int get totalPrice => price * quantity;
}
