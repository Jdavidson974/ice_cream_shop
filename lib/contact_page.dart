import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contact Us'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/background.jpg'), // Change l'image ici
              fit: BoxFit.fill, // L'image couvre toute la surface de l'écran
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Address
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.store,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Address:  14 Rue Pasteur, Saint-Denis 97400, La Réunion',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // Ouverture-Fermeture
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.schedule,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Opening Hours: Monday to Friday - 9:00 AM to 7:00 PM',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // Tel
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone_iphone,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Phone: +262 693 43 88 81',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Naviguer vers un formulaire de contact ou d'autres actions
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
            ],
          ),
        ));
  }
}
