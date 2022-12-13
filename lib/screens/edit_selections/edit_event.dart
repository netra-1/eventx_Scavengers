
import 'package:eventx/models/event/event_model.dart';
import 'package:flutter/material.dart';

class EditEventScreen extends StatefulWidget {
  const EditEventScreen({Key? key}) : super(key: key);

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  final _eventEditingController = TextEditingController();

  String searchQuery = "";

  List<EventModel> listEvent = [
    EventModel(
      name: "Birthday",
      description: "Birthday is good",
      image:
          "https://assets.cntraveller.in/photos/60ba1d2ea1a415b43b10be74/4:3/w_1420,h_1065,c_limit/coronavirus-lockdown-birthday-party-ideas.jpg",
    ),
    EventModel(
      name: "Wedding",
      description: "Birthday is good",
      image:
          "https://assets.cntraveller.in/photos/60ba1d2ea1a415b43b10be74/4:3/w_1420,h_1065,c_limit/coronavirus-lockdown-birthday-party-ideas.jpg",
    ),
    EventModel(
      name: "Anniversary",
      description: "Birthday is good",
      image:
          "https://assets.cntraveller.in/photos/60ba1d2ea1a415b43b10be74/4:3/w_1420,h_1065,c_limit/coronavirus-lockdown-birthday-party-ideas.jpg",
    ),
    EventModel(
      name: "Baby Shower",
      description: "Birthday is good",
      image:
          "https://assets.cntraveller.in/photos/60ba1d2ea1a415b43b10be74/4:3/w_1420,h_1065,c_limit/coronavirus-lockdown-birthday-party-ideas.jpg",
    ),
    EventModel(
      name: "Pre-Wedding",
      description: "Birthday is good",
      image:
          "https://assets.cntraveller.in/photos/60ba1d2ea1a415b43b10be74/4:3/w_1420,h_1065,c_limit/coronavirus-lockdown-birthday-party-ideas.jpg",
    ),
  ];

  List<dynamic>? draftList = [];
  var eventBooking;

  @override
  Widget build(BuildContext context) {
    eventBooking = ModalRoute.of(context)!.settings.arguments as Map;
    debugPrint(eventBooking.toString());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
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
                            color: const Color.fromRGBO(97, 62, 234, 1),

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
                      width: 100,
                    ),
                    const Text(
                      "Events",
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
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  controller: _eventEditingController,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(156, 183, 184, 186),
                      ),
                      // suffixIcon: IconButton(onPressed: onpressed, icon: const Icon(Icons.remove_red_eye_outlined)),
                      hintText: "Enter a Event Name",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(156, 152, 154, 156),
                          fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.all(8)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "* required";
                    }
                    return null;
                  },
                  // onTap: onTap,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: GridView.builder(
                    itemCount: listEvent.length,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 90 / 90,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      // debugPrint(index.toString());
                      return listEvent[index].name!
                              .toLowerCase()
                              .contains(searchQuery.toLowerCase())
                          ? doctorContainer(listEvent[index], index)
                          : const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget doctorContainer(EventModel eventName, int index) {
    // debugPrint("data===${event[0]}");
    // debugPrint("value===${event[1]}");
    // debugPrint("List===${listEvent[2]}");
    // debugPrint(index.toString());
    return InkWell(
      onTap: () {
        // final whiskey = <String, dynamic>{"EVENT":};
        eventBooking["EVENT"] = eventName.name;
        debugPrint("Total EVent : $eventBooking");
        Navigator.pushNamed(
          context,
          '/editDetailsScreen',
          arguments: eventBooking,
        );
        // debugPrint(doctorModel!.id! + department);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          // height: height * 0.13,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 233, 233, 233).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            // color: const Color.fromRGBO(11, 86, 222, 5),
            color: Colors.white,
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(eventName.image!),
              ),
              // SizedBox(
              //   width: 0.0468 * width,
              // ),
              Text(eventName.name!),
            ],
          ),
        ),
      ),
    );
  }
}
