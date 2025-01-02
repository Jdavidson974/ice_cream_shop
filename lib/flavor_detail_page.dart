import 'package:flutter/material.dart';

class FlavorDetailPage extends StatelessWidget {
  final String flavorName;
  final String flavorDescription;
  final String imagePath;
  final int flavorPrice;

  FlavorDetailPage({
    required this.flavorName,
    required this.flavorDescription,
    required this.imagePath,
    required this.flavorPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/background.jpg'), // Change l'image ici
            fit: BoxFit.fill, // L'image couvre toute la surface de l'écran
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 25),
              Text(flavorName, style: TextStyle(fontSize: 24)),
              SizedBox(height: 25),
              Image.asset(imagePath), // Affichage de l'image de la saveur
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  flavorDescription,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "$flavorPrice€", // interpolation
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
