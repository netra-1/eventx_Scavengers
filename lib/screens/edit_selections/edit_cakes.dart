import 'dart:io';
import 'package:eventx/models/cake/cake_model.dart';
import 'package:eventx/repository/event_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';

class EditCakesScreen extends StatefulWidget {
  const EditCakesScreen({Key? key}) : super(key: key);

  @override
  State<EditCakesScreen> createState() => _EditCakesScreenState();
}

class _EditCakesScreenState extends State<EditCakesScreen> {
  final _eventEditingController = TextEditingController();
  final _customCakePoundController = TextEditingController();

  String searchQuery = "";
  // int? imgSelectedIndex;
  List<int> selectedCakes = [];
  Map<String, dynamic> selectedCakesPound = {};

  int itemCount = 0;

  List<List<String>> listEvent = [
    [
      "https://images.immediate.co.uk/production/volatile/sites/30/2021/10/Red-velvet-cake-with-cheesecake-buttercream-7797aa1.jpg",
      "Rs 2500",
      "Red Velvet"
    ],
    [
      "https://bakewithshivesh.com/wp-content/uploads/2021/05/IMG_9384-scaled.jpg",
      "Rs 7000",
      "Black Forest"
    ],
    [
      "https://cdn.shopify.com/s/files/1/0034/8343/5072/products/WhatsAppImage2020-12-21at8.58.35PM_b0dcaa2a-e46f-4037-946b-a6a777316814.jpg?v=1610523901",
      "Rs 4500",
      "Chocolate truffle"
    ],
    [
      "https://images.immediate.co.uk/production/volatile/sites/30/2022/09/blueberry-cake-92fbaaf.jpg?quality=90&webp=true&resize=556,505",
      "Rs 15000",
      "Blue Berry"
    ],
  ];

  File? img;
  Future _loadImage(ImageSource imageSource, StateSetter setStateSheet) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setStateSheet(() {
          img = File(image.path);
        });
        setState(() {
          img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint('Failed to pick Image $e');
    }
  }

  var eventBooking;

  @override
  Widget build(BuildContext context) {
    // InternalLinkedHashMap<String, dynamic> invalidMap;
    eventBooking = ModalRoute.of(context)!.settings.arguments as Map;
    debugPrint("Choose Cakes: $eventBooking");
    setState(() {
      if (eventBooking["CUSTOM_CAKE_IMAGE"] != null) {
        setState(() {
        img = File(eventBooking["CUSTOM_CAKE_IMAGE"]);
          
        });
        _customCakePoundController.text = eventBooking["CUSTOM_CAKE_POUND"];
      }
    });

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
                      "Choose Cakes",
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
                      hintText: "Enter a Cake Name",
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
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.5,
                //   child: GridView.builder(
                //     itemCount: listEvent.length,
                //     scrollDirection: Axis.vertical,
                //     gridDelegate:
                //         const SliverGridDelegateWithFixedCrossAxisCount(
                //       childAspectRatio: 90 / 130,
                //       crossAxisCount: 2,
                //     ),
                //     itemBuilder: (context, index) {
                //       // debugPrint(index.toString());
                //       return listEvent[index][2]
                //               .toLowerCase()
                //               .contains(searchQuery.toLowerCase())
                //           ? cakeContainer(listEvent[index], index)
                //           : const SizedBox();
                //     },
                //   ),
                // ),
                FutureBuilder<List<CakeModel?>>(
                  future: EventRepository().loadCakeType(),
                  builder: (context, snapshot) {
                    // debugPrint("Data:::::${snapshot.data!.length}");
                    // debugPrint("Data:::::${snapshot.data![0]!.name}");

                    if (snapshot.hasData) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: GridView.builder(
                          itemCount: snapshot.data!.length,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 90 / 130,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            // debugPrint(index.toString());
                            return snapshot.data![index]!.name!
                                    .toLowerCase()
                                    .contains(searchQuery.toLowerCase())
                                ? cakeContainer(snapshot.data![index]!, index)
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
                const SizedBox(height: 15),
                Column(
                  children: [
                    Stack(
                      children: [
                        InkWell(
                          onTap: () => showMaterialModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(builder:
                                  (BuildContext context,
                                      StateSetter setStateSheet) {
                                return showModalCake(setStateSheet);
                              });
                            },
                          ),
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: img != null
                                ? BoxDecoration(
                                    image: DecorationImage(
                                        image: FileImage(img!),
                                        fit: BoxFit.cover),
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          255, 188, 188, 188),
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  )
                                : BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          255, 188, 188, 188),
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                            child: Center(
                              child: img == null
                                  ? const Icon(
                                      Icons.add_a_photo,
                                      size: 50,
                                    )
                                  : const SizedBox(),
                            ),
                          ),
                        ),
                        img != null
                            ? Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    color: Colors.grey[200],
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        img = null;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                    const Text("Custom Cake"),
                  ],
                ),

                Center(
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      key: const ValueKey('btnLogin'),
                      onPressed: () {
                        eventBooking["CAKES"] = selectedCakesPound;
                        if(img!=null){
                          eventBooking["CUSTOM_CAKE_IMAGE"] = img!.path;
                          eventBooking["CUSTOM_CAKE_POUND"] = _customCakePoundController.text;
                        }
                        Navigator.pushNamed(
                          context,
                          '/editDetailsScreen',
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

  Widget showModalCake(StateSetter setStateSheet) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          // const Text(
          //   "Choose Image",
          //   style: TextStyle(fontSize: 20),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Enter Pounds for custom cake"),
              SizedBox(
                height: 55,
                width: 50,
                child: TextFormField(
                  controller: _customCakePoundController,
                  // onChanged: (value) {
                  //   if (value.length == 1) {
                  //     FocusScope.of(context).nextFocus();
                  //   }
                  // },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    focusColor: Colors.grey,
                    border: OutlineInputBorder(),
                    // hintText: "0",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: () {
              _loadImage(ImageSource.gallery, setStateSheet);
            },
            icon: const Icon(Icons.image),
            label: const Text("Choose Image"),
          ),
          img != null
              ? CircleAvatar(
                  radius: 60,
                  backgroundImage: FileImage(img!),
                )
              : const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    "https://images.squarespace-cdn.com/content/v1/5aa7561885ede15b577392dc/1591981578111-ULMPB8IDQIKE0BRYKS7O/Boston+Cream.jpg?format=1500w",
                  ),
                ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                key: const ValueKey('btnLogin'),
                onPressed: () {
                  Navigator.of(context).pop();
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
                  "Confirm",
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

  Widget cakeContainer(CakeModel event, int index) {
    if (eventBooking["CAKES"] != null) {
      selectedCakesPound = eventBooking["CAKES"];
    }
    // debugPrint("data===${event[0]}");
    // debugPrint("value===${event[1]}");
    debugPrint("List===${listEvent[2]}");
    debugPrint(index.toString());
    return InkWell(
      onTap: () {
        setState(() {
          if (selectedCakes.contains(index)) {
            selectedCakes.remove(index);
          } else {
            selectedCakes.add(index);
          }
        });
        // Navigator.pushNamed(
        //   context,
        //   '/chooseDecorationScreen',
        // );
        // debugPrint(doctorModel!.id! + department);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          // height: height * 0.13,
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
              selectedCakes.contains(index)
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
              // CircleAvatar(
              //   radius: 60,
              //   backgroundImage: NetworkImage(event[0]),
              // ),
              Text(event.name!),
              Text("${event.price} per lbs"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  selectedCakesPound.containsKey(index.toString())
                      ? IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => setState(() {
                            if (selectedCakesPound
                                    .containsKey(index.toString()) &&
                                int.parse(selectedCakesPound[index.toString()]
                                        [1]) >
                                    0) {
                              int newCakePound = int.parse(
                                      selectedCakesPound[index.toString()][1]) -
                                  1;

                              selectedCakesPound[index.toString()][1] =
                                  newCakePound.toString();
                              if (selectedCakesPound
                                      .containsKey(index.toString()) &&
                                  int.parse(selectedCakesPound[index.toString()]
                                          [1]) <
                                      1) {
                                itemCount = 0;
                                selectedCakesPound.remove(index.toString());
                              }
                            }
                            debugPrint(
                                "Selected Pounds : ${selectedCakesPound.toString()}");
                          }),
                        )
                      : Container(),
                  selectedCakesPound.containsKey(index.toString())
                      ? Text(selectedCakesPound[index.toString()][1])
                      : const Text("0"),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => setState(() {
                      // itemCount++;
                      if (selectedCakesPound.containsKey(index.toString()) &&
                          int.parse(selectedCakesPound[index.toString()][1]) >
                              0) {
                        int newCakePound =
                            int.parse(selectedCakesPound[index.toString()][1]) +
                                1;
                        debugPrint("NewCake: $newCakePound");
                        selectedCakesPound[index.toString()][1] =
                            "$newCakePound";
                      } else {
                        itemCount = 1;
                        int newCakePound = 1;
                        final cakePound = <String, dynamic>{
                          index.toString(): [
                            event.name,
                            "$newCakePound",
                            event.id
                          ]
                        };
                        selectedCakesPound.addEntries(cakePound.entries);
                      }
                      debugPrint(
                          "Selected Pounds : ${selectedCakesPound.toString()}");
                    }),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
