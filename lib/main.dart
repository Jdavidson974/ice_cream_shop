import 'package:flutter/material.dart';
import 'package:ice_cream_shop/cart_page.dart';
import 'package:ice_cream_shop/map_page.dart';
import 'package:ice_cream_shop/menu_page.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
        brightness: Brightness.dark,
        primaryColor: Color(0xFF00FFFF), // Bleu néon
        colorScheme: ColorScheme.dark(
          primary: Color(0xFF00FFFF),
          secondary: Color(0xFFFF00FF), // Rose néon
        ),
        scaffoldBackgroundColor: Color(0xFF000000), // Fond noir
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Orbitron',
          ),
          bodyMedium: TextStyle(
            color: Colors.white60,
            fontSize: 16,
            fontFamily: 'Orbitron',
          ),
          headlineLarge: TextStyle(
            color: Color(0xFF00FFFF),
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'Orbitron',
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1A1A1A),
          elevation: 10,
          shadowColor: Color(0xFF00FFFF), // Effet de lueur
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Orbitron',
          ),
          iconTheme: IconThemeData(
            color: Color(0xFFFF00FF), // Rose néon pour les icônes
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF00FFFF),
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
      appBar: AppBar(
        title: Text('Ice Cream Shop'),
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
            colors: [Color(0xFF1A1A1A), Color(0xFF000000)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to our Ice Cream Shop!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 30),
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
                        fontWeight: FontWeight.bold,
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              NeonButton(
                text: 'Find Us on the Map',
                color: Color(0xFF00FFFF),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapPage()),
                  );
                },
              ),
              SizedBox(height: 20),
              NeonButton(
                text: 'See Our Menu',
                color: Color(0xFFFF00FF),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuPage()),
                  );
                },
              ),
              SizedBox(height: 20),
              NeonButton(
                text: 'Call Us',
                color: Color(0xFF00FFFF),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NeonButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  NeonButton(
      {required this.text, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        side: BorderSide(color: color, width: 2),
        shadowColor: color,
        elevation: 10,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 18,
          fontFamily: 'Orbitron',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
