import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class DetailsScreenDraft extends StatefulWidget {
  const DetailsScreenDraft({Key? key}) : super(key: key);


  @override
  State<DetailsScreenDraft> createState() => _DetailsScreenDraftState();
}

class _DetailsScreenDraftState extends State<DetailsScreenDraft> {

  var eventBooking;
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    eventBooking = ModalRoute.of(context)!.settings.arguments as Map;
    debugPrint("Details Screen: $eventBooking");
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 50,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.blue,
                              // border:
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "Back",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      const Text(
                        "Details",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(118, 125, 152, 1),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Event",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(210, 118, 125, 152),
                          ),
                        ),
                        Text(
                          eventBooking["EVENT"],
                          style: const TextStyle(
                            color: Color.fromRGBO(67, 67, 77, 0.9),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Date and Time",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(210, 118, 125, 152),
                          ),
                        ),
                        Text(
                          eventBooking["VENUE"]["Date"],
                          style: const TextStyle(
                            color: Color.fromRGBO(67, 67, 77, 0.9),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Venue",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(210, 118, 125, 152),
                          ),
                        ),
                        Text(
                          eventBooking["VENUE"]["Name"],
                          style: const TextStyle(
                            color: Color.fromRGBO(67, 67, 77, 0.9),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Theme",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(210, 118, 125, 152),
                          ),
                        ),
                        Text(
                          eventBooking["THEME"],
                          style: const TextStyle(
                            color: Color.fromRGBO(67, 67, 77, 0.9),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Drinks",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(210, 118, 125, 152),
                          ),
                        ),
                        Text(
                          "Whiskey ${eventBooking["DRINKS"]["WHISKEY"].length}| VODKA ${eventBooking["DRINKS"]["VODKA"].length}| SOFT ${eventBooking["DRINKS"]["SOFT"].length}| GIN ${eventBooking["DRINKS"]["GIN"].length}| WINE ${eventBooking["DRINKS"]["WINE"].length}| BRANDY ${eventBooking["DRINKS"]["BRANDY"].length}",
                          style: const TextStyle(
                            color: Color.fromRGBO(67, 67, 77, 0.9),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Cakes",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(210, 118, 125, 152),
                          ),
                        ),
                        Text(
                          eventBooking["CAKES"].length.toString(),
                          style: const TextStyle(
                            color: Color.fromRGBO(67, 67, 77, 0.9),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(210, 118, 125, 152),
                          ),
                        ),
                        Text(
                          "43500",
                          style: TextStyle(
                            color: Color.fromRGBO(67, 67, 77, 0.9),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        key: const ValueKey('btnLogin'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              // side: const BorderSide(color: Colors.red),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(0, 131, 29, 1)),
                        ),
                        child: const Text(
                          "Continue",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
