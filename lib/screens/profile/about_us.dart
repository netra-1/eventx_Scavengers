import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
              alignment: Alignment.centerLeft,
              // color: Colors.white,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 235, 235, 235)
                        .withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                // color: const Color.fromRGBO(11, 86, 222, 5),
                color: Colors.white,
              ),
              child: Column(
                children: const [
                  Text(
                    'We are a full-service event management company specializing in birthdays, weddings, and anniversaries. Our team of event professionals is dedicated to helping you plan and execute the perfect event, no matter the occasion.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
              alignment: Alignment.centerLeft,
              // color: Colors.white,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 235, 235, 235)
                        .withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                // color: const Color.fromRGBO(11, 86, 222, 5),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Our event management services include:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '- Event planning and coordination',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '- Venue selection and booking',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '- Budget management',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '- Guest list management',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '- Event marketing and promotion',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '- On-site event management',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Contact us today to start planning your next event!',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
