import 'package:eventx/models/event/event_model.dart';
import 'package:eventx/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ChooseEventScreen extends StatefulWidget {
  const ChooseEventScreen({Key? key}) : super(key: key);

  @override
  State<ChooseEventScreen> createState() => _ChooseEventScreenState();
}

class _ChooseEventScreenState extends State<ChooseEventScreen> {
  final _eventEditingController = TextEditingController();

  String searchQuery = "";
  List<EventModel> listEventNew = [];
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
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTmYPvgisuCMqQYS23f8wTZjq112qFLvODVSlpph9H8Q&s",
    ),
    EventModel(
      name: "Anniversary",
      description: "Birthday is good",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT03TLvzhmxrQ7WUZh6WEs-dIYHQYVtD2b-e9xomRIOoQ&s",
    ),
    EventModel(
      name: "Baby Shower",
      description: "Birthday is good",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvhPzjdanJEzMMDLZzDScEhXAAQo1FGssk-tiGNpO4&s",
    ),
    EventModel(
      name: "Pre-Wedding",
      description: "Birthday is good",
      image:
          "https://cdn0.weddingwire.in/article/7743/3_2/960/jpg/103477-pre-wedding-shoots-26.jpeg",
    ),
  ];

  Map<String, dynamic> eventBooking = {
    "DRAFT_ID": {},
    "EVENT": {},
    "VENUE": {},
    "THEME": {},
    "FOODS": {},
    "DRINKS": {
      "WHISKEY": {},
      "VODKA": {},
      "SOFT": {},
      "GIN": {},
      "WINE": {},
      "BRANDY": {}
    },
    "CAKES": {},
    "CUSTOM_CAKE_IMAGE": {},
    "CUSTOM_CAKE_POUND": {},
    "DECORATIONS": {},
    "TOTAL": {},
  };

  @override
  void initState() {
    // TODO: implement initState
    loadGetStorage();
    super.initState();
  }

  void loadGetStorage() async {
    await GetStorage.init();
  }

  List<dynamic> draftList = [];
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    // storage.remove(id!);
    if (storage.read(id!) == null) {
      draftList = [];
    } else {
      draftList = storage.read(id!);
    }
    debugPrint(eventBooking.toString());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: const [
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //   },
                    //   child: const SizedBox(
                    //     height: 50,
                    //     width: 50,
                    //     child: Icon(Icons.arrow_back_ios_new_outlined),
                    //   ),
                    // ),
                    SizedBox(
                      width: 120,
                    ),
                    Text(
                      "Choose Events",
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
                // TextFormField(
                //   onChanged: (value) {
                //     setState(() {
                //       searchQuery = value;
                //     });
                //   },
                //   controller: _eventEditingController,
                //   decoration: const InputDecoration(
                //       fillColor: Colors.white,
                //       prefixIcon: Icon(
                //         Icons.search,
                //         color: Color.fromARGB(156, 183, 184, 186),
                //       ),
                //       // suffixIcon: IconButton(onPressed: onpressed, icon: const Icon(Icons.remove_red_eye_outlined)),
                //       hintText: "Enter a Event Name",
                //       hintStyle: TextStyle(
                //           color: Color.fromARGB(156, 152, 154, 156),
                //           fontWeight: FontWeight.w500),
                //       border: OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: Colors.transparent,
                //         ),
                //         borderRadius: BorderRadius.all(Radius.circular(20)),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: Colors.transparent,
                //         ),
                //         borderRadius: BorderRadius.all(Radius.circular(20)),
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: Colors.transparent,
                //         ),
                //         borderRadius: BorderRadius.all(Radius.circular(20)),
                //       ),
                //       filled: true,
                //       contentPadding: EdgeInsets.all(8)),
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return "* required";
                //     }
                //     return null;
                //   },
                //   // onTap: onTap,
                //   keyboardType: TextInputType.visiblePassword,
                //   obscureText: false,
                // ),
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
                      // if (listEvent[index]
                      //     .name!
                      //     .toLowerCase()
                      //     .contains(searchQuery.toLowerCase())) {
                      //       listEventNew.add(listEvent[index]);
                      // }
                      return listEvent[index]
                              .name!
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
        eventBooking["DRAFT_ID"] = "DRAFT_ID:${DateTime.now()}";
        debugPrint("Total EVent : $eventBooking");
        draftList.add(eventBooking);
        storage.write(id!, draftList);
        Navigator.pushNamed(
          context,
          '/chooseVenue',
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
