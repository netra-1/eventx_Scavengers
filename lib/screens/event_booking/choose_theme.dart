import 'package:eventx/models/theme/theme_model.dart';
import 'package:eventx/repository/event_booking.dart';
import 'package:eventx/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ChooseThemeScreen extends StatefulWidget {
  const ChooseThemeScreen({Key? key}) : super(key: key);

  @override
  State<ChooseThemeScreen> createState() => _ChooseThemeScreenState();
}

class _ChooseThemeScreenState extends State<ChooseThemeScreen> {
  final _eventEditingController = TextEditingController();

  String searchQuery = "";

  List<List<String>> listEvent = [
    [
      "https://www.table-art.co.uk/wp-content/uploads/atlantis-underwater-event-theme-2.jpg?v=1645079362",
      "Under The Sea"
    ],
    [
      "https://www.table-art.co.uk/wp-content/uploads/asian-parasol-prop-1.jpg?v=1645077958",
      "Ibiza"
    ],
    [
      "https://www.table-art.co.uk/wp-content/uploads/grey-inflatable-elephant.jpg?v=1645077608",
      "Dream Circus"
    ],
    [
      "https://www.table-art.co.uk/wp-content/uploads/art-deco-gatsby-event-theme-marrakech-1.jpg?v=1645079369",
      "Roaring 20"
    ],
  ];

  List<dynamic> draftList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void loadGetStorage() async {
    await GetStorage.init();
  }

  final storage = GetStorage();
  var eventBooking;

  @override
  Widget build(BuildContext context) {
    if (storage.read(id!) != null) {
      draftList = storage.read(id!);
    }
    eventBooking = ModalRoute.of(context)!.settings.arguments as Map;
    debugPrint("ChooseTheme: ${eventBooking["DRINKS"]["SOFT"]}");
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
                      child: const SizedBox(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.arrow_back_ios_new_outlined),
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    const Text(
                      "Choose Theme",
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
                FutureBuilder<List<ThemeModel?>>(
                  future: EventRepository().loadThemeType(),
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
                            childAspectRatio: 90 / 90,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            // debugPrint(index.toString());
                            return snapshot.data![index]!.name!
                                    .toLowerCase()
                                    .contains(searchQuery.toLowerCase())
                                ? themeContainer(snapshot.data![index]!, index)
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget themeContainer(ThemeModel theme, int index) {
    // debugPrint("data===${event[0]}");
    // debugPrint("value===${event[1]}");
    debugPrint("List===${listEvent[2]}");
    debugPrint(index.toString());
    return InkWell(
      // onTap: () {
      //   Navigator.pushNamed(
      //     context,
      //     '/chooseVenue',
      //   );
      //   // debugPrint(doctorModel!.id! + department);
      // },
      onTap: () => showMaterialModalBottomSheet(
        context: context,
        builder: (context) => showModalVenue(theme),
      ),
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
                backgroundImage: NetworkImage(theme.image!.url!),
              ),
              // SizedBox(
              //   width: 0.0468 * width,
              // ),
              Text(theme.name!),
            ],
          ),
        ),
      ),
    );
  }

  Widget showModalVenue(ThemeModel theme) {
    // debugPrint("data===${event[0]}");
    // debugPrint("value===${event[1]}");
    // debugPrint("List===${listEvent[2]}");
    // debugPrint(index.toString());
    return Container(
      height: 400,
      width: double.infinity,
      margin: const EdgeInsets.all(3.0),
      padding: const EdgeInsets.all(3.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 140.0,
                width: 140.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(theme.image!.url!),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  theme.name!,
                  style: const TextStyle(fontSize: 23),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(theme.speciality[0]!),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 48, 47, 47),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "Description",
              style: TextStyle(fontSize: 21),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(theme.description!),
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                key: const ValueKey('btnLogin'),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const ChooseDrinksCategoryScreen(),
                  //     maintainState: true,
                  //   ),
                  // );
                  eventBooking["THEME"] = [theme.name!, theme.id!];
                  for (var i = 0; i < draftList.length; i++) {
                    if (draftList[i]["DRAFT_ID"] == eventBooking["DRAFT_ID"]) {
                      draftList[i] = eventBooking;
                    }
                  }
                  debugPrint("Draft list for theme: $draftList");
                  storage.write(id!, draftList);
                  Navigator.pushNamed(
                    context,
                    '/chooseDrinksCategory',
                    arguments: eventBooking,
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
    );
  }
}
