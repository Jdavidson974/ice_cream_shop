import 'package:flutter/material.dart';
import 'package:ice_cream_shop/cart_page.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'models/cart_item.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'flavor_detail_page.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Ice Cream Menu'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart), // Icône du panier
            onPressed: () {
              // Navigation vers la page du panier
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
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Afficher X éléments par ligne
            crossAxisSpacing: 16.0, // Espacement horizontal entre les cartes
            mainAxisSpacing: 16.0, // Espacement vertical entre les cartes
            childAspectRatio:
                1.0, // Aspect ratio pour garder les cartes carrées
          ),
          itemCount:
              4, // Nombre d'éléments dans la liste (Simulation des elements recuperé en BDD)
          itemBuilder: (context, index) {
            return Card(
              color: Color(0xFF1C1C1C), // Fond sombre pour la carte
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    8.0), // Coins arrondis pour les cartes
              ),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_getImagePath(
                        index)), // Chargement de l'image en fonction de l'index
                    fit: BoxFit.cover,
                  ),
                  borderRadius:
                      BorderRadius.circular(8.0), // Coins arrondis pour l'image
                ),
                child: GestureDetector(
                  //Decommenter pour ajouter l'acces à la page détail si le client en veut une.
                  // onTap: () {
                  //   // Navigation vers la page de détails
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => FlavorDetailPage(
                  //         flavorName: _getFlavorName(index),
                  //         flavorDescription: _getFlavorDescription(index),
                  //         imagePath: _getImagePath(index),
                  //         flavorPrice: _getFlavorPrice(index),
                  //       ),
                  //     ),
                  //   );
                  // },
                  child: Container(
                    padding: EdgeInsets.all(
                        16.0), // Padding pour que le texte ne touche pas les bords
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(
                          0.5), // Fond semi-transparent pour améliorer la lisibilité du texte
                      borderRadius: BorderRadius.circular(
                          8.0), // Coins arrondis pour le fond du texte
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _getFlavorName(index),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        // Espacement entre le nom et la description
                        Text(
                          _getFlavorDescription(index),
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          " ${_getFlavorPrice(index).toString()}€ ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            // Ajouter l'article au panier
                            final cartItem = CartItem(
                              flavorName: _getFlavorName(index),
                              imagePath: _getImagePath(index),
                              price: _getFlavorPrice(index),
                            );
                            Provider.of<CartProvider>(context, listen: false)
                                .addItem(cartItem);

                            // Afficher un toast indiquant que l'article a bien été ajouté au panier
                            Fluttertoast.showToast(
                                msg: "Item added to cart!",
                                toastLength:
                                    Toast.LENGTH_SHORT, // Durée d'affichage
                                gravity: ToastGravity
                                    .BOTTOM, // Position en bas de l'écran
                                timeInSecForIosWeb:
                                    1, // Durée d'affichage pour iOS/Web
                                backgroundColor: Color(0xFF1C1C1C),
                                textColor: Color(0xFF00FF00),
                                fontSize: 16.0);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1C1C1C),
                          ),
                          child: Text('Add to Cart'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  //Simulation des data obtenus en BDD
  // Fonction pour obtenir le chemin de l'image en fonction de l'index
  String _getImagePath(int index) {
    switch (index) {
      case 0:
        return 'assets/images/vanilla.jpg'; // Image de la saveur Vanille
      case 1:
        return 'assets/images/chocolate.jpg'; // Image de la saveur Chocolat
      case 2:
        return 'assets/images/strawberry.jpg'; // Image de la saveur Fraise
      case 3:
        return 'assets/images/mint.jpg'; // Image de la saveur Menthe
      default:
        return 'assets/images/default.jpg'; // Image par défaut
    }
  }

  // Fonction pour obtenir le nom de la saveur en fonction de l'index
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

  // Fonction pour obtenir le nom de la saveur en fonction de l'index
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

  // Fonction pour obtenir la description de la saveur en fonction de l'index
  String _getFlavorDescription(int index) {
    switch (index) {
      case 0:
        return 'Delicious vanilla ice cream';
      case 1:
        return 'Rich chocolate ice cream';
      case 2:
        return 'Sweet strawberry ice cream';
      case 3:
        return 'Fresh mint ice cream';
      default:
        return '';
    }
  }
}
