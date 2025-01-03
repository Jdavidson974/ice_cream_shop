import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Address
                Row(
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
                SizedBox(height: 10),
                // Opening Hours
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
                SizedBox(height: 10),
                // Phone
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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    const phoneNumber = '0692380854';
                    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
                    try {
                      await launchUrl(phoneUri,
                          mode: LaunchMode.externalApplication);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('Error: Unable to open phone dialer')),
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
      ),
    );
  }
}
