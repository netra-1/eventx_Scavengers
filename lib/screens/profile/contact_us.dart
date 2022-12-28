import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'We value your feedback. Please contact us using the information below:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text('Phone', style: TextStyle(fontWeight: FontWeight.w700)),
                  SizedBox(height: 10),
                  Text('1-800-555-1234'),
                  SizedBox(height: 10),
                  Text('Email', style: TextStyle(fontWeight: FontWeight.w700)),
                  SizedBox(height: 10),
                  Text('info@company.com'),
                  SizedBox(height: 10),
                  Text('Address', style: TextStyle(fontWeight: FontWeight.w700)),
                  SizedBox(height: 10),
                  Text('123 Main Street, Anytown, USA 12345'),
                  SizedBox(height: 20),
                  Text(
                    'You can also Contact us by sending us Message through our social media',
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
