import 'package:flutter/material.dart';

class TermsConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                      'Last updated: January 1, 2021',
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
                  children: const [
                    Text(
                      'Introduction',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Welcome to our event management application (the “Application”). By accessing or using the Application, you agree to be bound by these terms and conditions (“Terms”). Please read them carefully. If you do not agree to all of these Terms, do not use the Application. We reserve the right to change these Terms at any time. Your continued use of the Application following the posting of any changes will mean that you accept those changes.',
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
                  children: const [
                    Text(
                      'Use of Application',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'You may only use the Application for lawful purposes. You may not use the Application: (a) in any way that breaches any applicable local, national, or international law or regulation; (b) in any way that is unlawful or fraudulent, or has any unlawful or fraudulent purpose or effect; or (c) to transmit, or procure the sending of, any unsolicited or unauthorized advertising or promotional material.',
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
                  children: const [
                    Text(
                      'Event Submission',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'You may submit events for inclusion in the Application. By submitting an event, you represent and warrant that you have the right to use all information and materials provided, and that the event does not violate any applicable laws or regulations. We reserve the right to reject any event for any reason.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
