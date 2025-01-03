import 'package:flutter/material.dart';
import 'package:ice_cream_shop/contact_page.dart';
import 'package:ice_cream_shop/map_page.dart';
import 'package:provider/provider.dart';
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
      appBar: AppBar(
        title: Text('Ice Cream Shop'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill, // L'image couvre toute la surface de l'écran
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to our Ice Cream Shop!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20), // Espace entre le texte et le bouton
              ElevatedButton(
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1C1C1C),
                ),
                child: Text('Contact Us'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
