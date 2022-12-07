import 'package:eventx/models/decoration/decoration_model.dart';
import 'package:eventx/repository/event_booking.dart';
import 'package:eventx/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ChooseDecorationsScreen extends StatefulWidget {
  const ChooseDecorationsScreen({Key? key}) : super(key: key);

  @override
  State<ChooseDecorationsScreen> createState() =>
      _ChooseDecorationsScreenState();
}

class _ChooseDecorationsScreenState extends State<ChooseDecorationsScreen> {
  final _eventEditingController = TextEditingController();

  String searchQuery = "";

  Map<String, dynamic> selectedCakes = {};

  List<List<String>> listEvent = [
    [
      "https://images.unsplash.com/photo-1526047932273-341f2a7631f9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bG92ZSUyMGZsb3dlcnN8ZW58MHx8MHx8&w=1000&q=80",
      "Rs 7000",
      "Flowers",
      "637a0bf34dee43bbb8b3810e"
    ],
    [
      "https://static01.nyt.com/images/2022/03/24/fashion/24balloons-1/merlin_202692690_9a0c0f65-ab11-4bd8-861a-5d1beabbc348-mobileMasterAt3x.jpg",
      "Rs 3000",
      "Baloons",
      "637a0bf34dee43bbb8b3810e"
    ],
    [
      "https://theordinarygift.com/wp-content/uploads/wedding-white-back.png",
      "Rs 9000",
      "Flex board",
      "637a0bf34dee43bbb8b3810e"
    ],
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void loadGetStorage() async {
    await GetStorage.init();
  }

  final storage = GetStorage();
  List<dynamic> draftList = [];

  var eventBooking;

  @override
  Widget build(BuildContext context) {
    if (storage.read(id!) != null) {
      draftList = storage.read(id!);
    }
    eventBooking = ModalRoute.of(context)!.settings.arguments as Map;
    debugPrint("Choose Decorations: $eventBooking");
    debugPrint("Draft List: $draftList");
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
                      width: 80,
                    ),
                    const Text(
                      "Choose Decorations",
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
                FutureBuilder<List<DecorationModel?>>(
                  future: EventRepository().loadDecorations(),
                  builder: (context, snapshot) {
                    // debugPrint("Data:::::${snapshot.data!.length}");
                    // debugPrint("Data:::::${snapshot.data![0]!.name}");

                    if (snapshot.hasData) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: GridView.builder(
                          itemCount: snapshot.data!.length,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 90 / 110,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            // debugPrint(index.toString());
                            return snapshot.data![index]!.name!
                                    .toLowerCase()
                                    .contains(searchQuery.toLowerCase())
                                ? doctorContainer(snapshot.data![index]!, index)
                                : const SizedBox();
                          },
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Text("Error");
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      key: const ValueKey('btnLogin'),
                      onPressed: () {
                        eventBooking["DECORATIONS"] = selectedCakes;
                        for (var i = 0; i < draftList.length; i++) {
                          if (draftList[i]["DRAFT_ID"] ==
                              eventBooking["DRAFT_ID"]) {
                            draftList[i] = eventBooking;
                          }
                        }
                        storage.write(id!, draftList);
                        Navigator.pushNamed(
                          context,
                          '/detailsScreen',
                          arguments: eventBooking,
                        );
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
                            const Color.fromARGB(255, 121, 61, 225)),
                      ),
                      child: const Text(
                        "Continue",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget doctorContainer(DecorationModel event, int index) {
    // debugPrint("data===${event[0]}");
    // debugPrint("value===${event[1]}");
    debugPrint("List===${listEvent[2]}");
    debugPrint(index.toString());
    return InkWell(
      onTap: () {
        setState(() {
          if (selectedCakes.containsKey(index.toString())) {
            selectedCakes.remove(index.toString());
          } else {
            final decoration = <String, dynamic>{
              index.toString(): [
                event.name,
                event.id,
              ]
            };
            selectedCakes.addEntries(decoration.entries);
          }
        });
        debugPrint("Selected Cakes $selectedCakes");
        // eventBooking["DECORATIONS"] = event[3];
        // for(var i=0; i<draftList.length;i++){
        //   if(draftList[i]["DRAFT_ID"] == eventBooking["DRAFT_ID"]){
        //     draftList[i] = eventBooking;
        //   }
        // }
        // storage.write(id!, draftList);
        // Navigator.pushNamed(
        //   context,
        //   '/detailsScreen',
        //   arguments: eventBooking,

        // );
        // debugPrint(doctorModel!.id! + department);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          // height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            // boxShadow: [
            //   BoxShadow(
            //     color:
            //         const Color.fromARGB(255, 233, 233, 233).withOpacity(0.5),
            //     spreadRadius: 5,
            //     blurRadius: 7,
            //     offset: const Offset(0, 3), // changes position of shadow
            //   ),
            // ],
            borderRadius: BorderRadius.circular(20),
            // color: const Color.fromRGBO(11, 86, 222, 5),
            color: Colors.white,
          ),
          child: Column(
            children: [
              selectedCakes.containsKey(index.toString())
                  ? CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 139, 113, 255),
                      radius: 60,
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage: NetworkImage(event.image!.url!),
                      ),
                    )
                  : CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(event.image!.url!),
                    ),
              // SizedBox(
              //   width: 0.0468 * width,
              // ),
              Text(event.name!),
              Text("${event.price!}"),
            ],
          ),
        ),
      ),
    );
  }
}
