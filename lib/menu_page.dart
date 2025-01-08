import 'package:flutter/material.dart';
import 'package:ice_cream_shop/cart_page.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'models/cart_item.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Our Ice Cream Menu',
          style: TextStyle(
            fontFamily: 'Orbitron',
            color: Color(0xFF00FFFF),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Color(0xFF00FFFF)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF1A1A2E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Deux colonnes
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.65, // Plus de hauteur pour le contenu
          ),
          padding: EdgeInsets.all(16.0),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 8.0,
              shadowColor: Color(0xFF00FFFF).withOpacity(0.5), // Ombre néon
              child: Column(
                children: [
                  // IMAGE
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15.0),
                        ),
                        image: DecorationImage(
                          image: AssetImage(_getImagePath(index)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // CONTENU DYNAMIQUE
                  Expanded(
                    flex: 3, // Plus d'espace pour gérer la description
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // NOM
                          Text(
                            _getFlavorName(index),
                            style: TextStyle(
                              fontFamily: 'Orbitron',
                              color: Color(0xFFFF00FF),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 4.0),
                          // DESCRIPTION
                          Expanded(
                            child: SingleChildScrollView(
                              child: Text(
                                _getFlavorDescription(index),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.0),
                          // PRIX
                          Text(
                            "${_getFlavorPrice(index)}€",
                            style: TextStyle(
                              color: Color(0xFFFF00FF), // Vert néon
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // BOUTON
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        final cartItem = CartItem(
                          flavorName: _getFlavorName(index),
                          imagePath: _getImagePath(index),
                          price: _getFlavorPrice(index),
                        );
                        Provider.of<CartProvider>(context, listen: false)
                            .addItem(cartItem);

                        Fluttertoast.showToast(
                          msg: "Item added to cart!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Color(0xFF1C1C1C),
                          textColor: Color(0xFFFF00FF),
                          fontSize: 16.0,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: BorderSide(color: Color(0xFF00FFFF), width: 2),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Color(0xFF00FFFF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  String _getImagePath(int index) {
    switch (index) {
      case 0:
        return 'assets/images/vanilla.jpg';
      case 1:
        return 'assets/images/chocolate.jpg';
      case 2:
        return 'assets/images/strawberry.jpg';
      case 3:
        return 'assets/images/mint.jpg';
      default:
        return 'assets/images/default.jpg';
    }
  }

  String _getFlavorName(int index) {
    switch (index) {
      case 0:
        return 'Vanilla';
      case 1:
        return 'Chocolate';
      case 2:
        return 'Strawberry';
      case 3:
        return 'Mint';
      default:
        return '';
    }
  }

  int _getFlavorPrice(int index) {
    switch (index) {
      case 0:
        return 2;
      case 1:
        return 3;
      case 2:
        return 4;
      case 3:
        return 1;
      default:
        return 0;
    }
  }

  String _getFlavorDescription(int index) {
    switch (index) {
      case 0:
        return 'Delicious vanilla ice cream with a touch of sweetness.';
      case 1:
        return 'Rich and creamy chocolate for chocolate lovers.';
      case 2:
        return 'Sweet and tangy strawberry, perfect for summer.';
      case 3:
        return 'Fresh mint with a cooling sensation.';
      default:
        return '';
    }
  }
}
