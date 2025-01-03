import 'package:flutter/material.dart';
import 'package:ice_cream_shop/cart_page.dart';
// import 'package:ice_cream_shop/contact_page.dart';
import 'package:ice_cream_shop/map_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'menu_page.dart';
import 'providers/cart_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: IceCreamShopApp(),
    ),
  );
}

class IceCreamShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ice Cream Shop',
      theme: ThemeData(
        primaryColor: Color(0xFF00FF00),
        colorScheme: ColorScheme.light(
          primary: Color(0xFF00FF00),
          secondary: Color(0xFF00FF00),
        ),
        scaffoldBackgroundColor: Color(0xFF121212), // Fond sombre
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontSize: 18),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 18),
          headlineLarge: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        ),
        appBarTheme: AppBarTheme(
          color: Color(0xFF1C1C1C),
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
          iconTheme: IconThemeData(
            color: Color(0xFF00FF00), // Vert néon pour la flèche
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ice Cream Shop'), actions: [
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
      ]),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover, // L'image couvre toute la surface de l'écran
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // Titre
                'Welcome to our Ice Cream Shop!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Row(
                //Adresse
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.store,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      'Address: 14 Rue Pasteur, Saint-Denis 97400, La Réunion',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Horraire d'ouverture
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.schedule,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      'Opening Hours: Monday to Friday - 9:00 AM to 7:00 PM',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Tel
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.phone_iphone,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      'Phone: +262 692 38 08 54',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), // Espace entre le texte et le bouton
              ElevatedButton(
                // Bouton pour acces a la page map
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1C1C1C),
                ),
                child: Text('Find Us on the Map'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                // Bouton pour avoir acces au menu du magasin
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1C1C1C),
                ),
                child: Text('See Our Menu'),
              ),
              // Page contact a décommenter si le client veut une page contact en plus ,
              // Mais supprimer les infos de contact de cette page

              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => ContactPage()),
              //     );
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Color(0xFF1C1C1C),
              //   ),
              //   child: Text('Contact Us'),
              // ),
              SizedBox(height: 20),
              ElevatedButton(
                //Bouton pour composer le numero
                onPressed: () async {
                  const phoneNumber = '0692380854';
                  final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
                  try {
                    await launchUrl(phoneUri,
                        mode: LaunchMode.externalApplication);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Error: Unable to open phone dialer')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1C1C1C),
                ),
                child: Text('Call Us'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
