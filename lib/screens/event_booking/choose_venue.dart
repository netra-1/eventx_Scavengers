import 'package:eventx/models/venue/filtered_venue_model.dart';
import 'package:eventx/repository/event_booking.dart';
import 'package:eventx/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ChooseVenueScreen extends StatefulWidget {
  const ChooseVenueScreen({Key? key}) : super(key: key);

  @override
  State<ChooseVenueScreen> createState() => _ChooseVenueScreenState();
}

class _ChooseVenueScreenState extends State<ChooseVenueScreen> {
  List<dynamic> draftList = [];
  final _noOfPeopleEditingController = TextEditingController();
  final _dateEditingController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  bool show = false;

  String? indoor = "INDOOR";
  String? outdoor = "";

  var eventBooking;

  @override
  void initState() {
    loadGetStorage();
    super.initState();
  }

  void loadGetStorage() async {
    await GetStorage.init();
  }

  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    if (storage.read(id!) == null) {
      draftList = [];
    } else {
      draftList = storage.read(id!);
    }

    eventBooking = ModalRoute.of(context)!.settings.arguments as Map;
    // draftList.add(eventBooking);
    // debugPrint("Choose Venue Part: $newAllDrinks");
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _globalKey,
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
                        "Choose Venue",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(118, 125, 152, 1),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          key: const ValueKey("txtNoOfPeople"),
                          controller: _noOfPeopleEditingController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 192, 192, 192),
                            ),
                            labelText: "No of people",
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 192, 192, 192),
                            ),
                            border: UnderlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter venue capacity";
                            }
                            return null;
                          },
                        ),
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          height: 70,
                          child: Center(
                            child: TextField(
                              controller: _dateEditingController,
                              //editing controller of this TextField
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.calendar_today),
                                  labelText: "Choose Date"),
                              readOnly: true,

                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2100));

                                if (pickedDate != null) {
                                  debugPrint(pickedDate.toString());
                                  String formattedDate =
                                      // DateFormat.yMMMMd().format(pickedDate);
                                      // DateFormat.yMd().format(pickedDate);
                                      pickedDate.toString().split(" ").first;
                                  debugPrint(formattedDate);
                                  setState(() {
                                    _dateEditingController.text = formattedDate;
                                  });
                                } else {}
                              },
                            ),
                          ),
                        ),
                        ListTile(
                          title: const Text('Indoor'),
                          leading: Radio(
                            value: "INDOOR",
                            groupValue: indoor,
                            toggleable: true,
                            autofocus: true,
                            onChanged: (value) {
                              setState(() {
                                indoor = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Outdoor'),
                          leading: Radio(
                            value: "OUTDOOR",
                            groupValue: outdoor,
                            toggleable: true,
                            onChanged: (value) {
                              setState(() {
                                outdoor = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: InkWell(
                            key: const ValueKey("btnNext"),
                            onTap: () {
                              if (_globalKey.currentState!.validate()) {
                                setState(() {
                                  show = true;
                                });
                                // debugPrint("INDOOR value: $indoor");
                                // debugPrint("OUTDOOR value: $outdoor");

                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color.fromRGBO(97, 62, 234, 1),
                              ),
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: const Center(
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (show == true)
                    FutureBuilder<List<FilteredVenueModel?>>(
                      future: EventRepository().loadFilteredVenueType(
                          int.parse(_noOfPeopleEditingController.text),
                          _dateEditingController.text,
                          indoor,
                          outdoor),
                      builder: (context, snapshot) {
                        // debugPrint("Data:::::${snapshot.data!.length}");
                        // debugPrint("Data:::::${snapshot.data![0]!.name}");

                        if (snapshot.hasData) {
                          if (snapshot.data!.isNotEmpty) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: ListView.builder(
                                itemCount: snapshot.data!.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  // debugPrint(index.toString());
                                  return venueContainer(
                                      snapshot.data![index]!, index);
                                },
                              ),
                            );
                          } else {
                            return const Text(
                              "The data you were filtering was not found",
                              style: TextStyle(color: Colors.grey),
                            );
                          }
                        } else if (snapshot.hasError) {
                          return const Text("Error");
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  // const SizedBox(height: 0)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget venueContainer(FilteredVenueModel venue, int index) {
    // debugPrint("data===${event[0]}");
    // debugPrint("value===${event[1]}");
    // debugPrint("List===${listEvent[2]}");
    // debugPrint(index.toString());
    return InkWell(
      onTap: () => showMaterialModalBottomSheet(
        context: context,
        builder: (context) => showModalVenue(venue),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        // height: height * 0.13,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 233, 233, 233).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          // color: const Color.fromRGBO(11, 86, 222, 5),
          color: Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const Image(
                  image: NetworkImage(
                      "https://lh5.googleusercontent.com/p/AF1QipPVOcAlRPV3fFuNZsjlNabwt_wE4xh4mwFoBtGH=w143-h143-n-k-no"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // SizedBox(
            //   width: 0.0468 * width,
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 0.013 * MediaQuery.of(context).size.height,
                  ),
                  Text(
                    venue.name!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "${venue.location!.split(',')[0]},${venue.location!.split(',').last}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 0.013 * MediaQuery.of(context).size.height,
                  ),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: 3.5,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 21.0,
                        direction: Axis.horizontal,
                      ),
                      const Text(
                        "3.5",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showModalVenue(FilteredVenueModel venue) {
    // debugPrint("data===${event[0]}");
    // debugPrint("value===${event[1]}");
    // debugPrint("List===${listEvent[2]}");
    // debugPrint(index.toString());
    return Container(
      height: 465,
      width: double.infinity,
      margin: const EdgeInsets.all(3.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        border: Border.all(
          width: 1,
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
                height: 90.0,
                width: 90.0,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://c0.wallpaperflare.com/preview/189/77/169/blackpool-united-kingdom-winter-gardens-uhd.jpg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              // const SizedBox(width: 20),
              Container(
                height: 130.0,
                width: 130.0,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://lh5.googleusercontent.com/p/AF1QipPVOcAlRPV3fFuNZsjlNabwt_wE4xh4mwFoBtGH=w143-h143-n-k-no'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Container(
                height: 90.0,
                width: 90.0,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://c0.wallpaperflare.com/preview/189/77/169/blackpool-united-kingdom-winter-gardens-uhd.jpg'),
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
                  venue.name!,
                  style: const TextStyle(fontSize: 23),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(venue.location!),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.verified_rounded,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 8),
                      const Text("Available")
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBarIndicator(
                      rating: 3.5,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 21.0,
                      direction: Axis.horizontal,
                    ),
                    const SizedBox(width: 5),
                    const Text("3.5   "),
                  ],
                ),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "Planning for your big day is an exciting and an overwhelming task as there are so many smallest of the details to be taken care of. Booking your event venue is certainly one of the stressful ",
              // style: TextStyle(fontSize: 21),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                key: const ValueKey('btnLogin'),
                onPressed: () {
                  eventBooking["VENUE"] = {
                    "No Of People": _noOfPeopleEditingController.text,
                    "Date": _dateEditingController.text,
                    "Name": venue.name!,
                    "id": venue.id,
                  };
                  for (var i = 0; i < draftList.length; i++) {
                    if (draftList[i]["DRAFT_ID"] == eventBooking["DRAFT_ID"]) {
                      debugPrint("Compared true......................");
                      draftList[i] = eventBooking;
                      debugPrint("Draft List${draftList[i]}");
                    }
                  }
                  storage.write(id!, draftList);
                  Navigator.pushNamed(
                    context,
                    '/chooseTheme',
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
