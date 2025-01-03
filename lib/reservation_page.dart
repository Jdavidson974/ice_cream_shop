import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReservationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/background.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // QR Code (le widget QrImage est bien intégré ici)
              SizedBox(
                width: 200.0,
                height: 200.0,
                child: QrImageView(
                    data: "https://sautronjeandavidson.re/", // Données QR
                    version: QrVersions.auto,
                    size: 200.0,
                    backgroundColor: Color(0xFF00FF00)),
              ),
              SizedBox(height: 16.0),
              // Message explicatif
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "This QR code allows you to place an order directly in our store without going to the cashier.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
