import 'package:eventxandroid/models/payment/cake_details.dart';
import 'package:eventxandroid/models/payment/items_details.dart';
import 'package:eventxandroid/models/payment/payment_details.dart';
import 'package:eventxandroid/repository/payment_repository.dart';
import 'package:eventxandroid/screens/bottom_nav_bar.dart';
import 'package:eventxandroid/utils/display_message.dart';
import 'package:eventxandroid/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class KhaltiPaymentScreen extends StatefulWidget {
  final int index;
  const KhaltiPaymentScreen({Key? key, this.index = 9999}) : super(key: key);

  @override
  State<KhaltiPaymentScreen> createState() => _KhaltiPaymentScreenState();
}

class _KhaltiPaymentScreenState extends State<KhaltiPaymentScreen> {
  final _amountController = TextEditingController();
  @override
  void initState() {
    _amountController.text = 10.toString();
    loadGetStorage();
    super.initState();
  }

  void loadGetStorage() async {
    await GetStorage.init();
  }

  List<dynamic> draftList = [];
  final storage = GetStorage();

  getAmt() {
    // return int.parse(_amountController.text) * 100; // Converting to paisa
    return int.parse(_amountController.text) * 100;
  }

  List<Items?> drink = [];
  List<Cakes?> cake = [];
  List<String?> decoration = [];

  var eventBooking;
  @override
  Widget build(BuildContext context) {
    if (storage.read(id!) != null) {
      draftList = storage.read(id!);
    }
    eventBooking = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  // color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  "Payment",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(),
                const SizedBox(),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 15,
                        offset: Offset(2, 6),
                        spreadRadius: -18,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  height: 218,
                  width: 320,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Payment Method",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 19),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () {
                            // debugPrint()eventBooking["CUSTOM_CAKE_IMAGE"]
                            
                          },
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {}, // Image tapped
                                splashColor:
                                    Colors.white10, // Splash color over image
                                child: Image.network(
                                  "https://blog.khalti.com/wp-content/uploads/2021/02/Naya_Khalti_Logo_icon_2018.jpg",
                                  fit: BoxFit.contain, // Fixes border issues
                                  width: 70,
                                  height: 70,
                                ),
                              ),
                              const Text(
                                "Khalti",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            // debugPrint(
                            //     "AFTER SUCCESS: ${eventBooking["CUSTOM_CAKE_IMAGE"]}");
                            // if (drink.isEmpty) {
                            //   if (eventBooking["DRINKS"].isNotEmpty) {
                            //     eventBooking["DRINKS"].forEach((key, value) {
                            //       if (!value.isEmpty) {
                            //         debugPrint("Key $key and Value $value");

                            //         value.forEach((key, value) {
                            //           drink.add(Items(
                            //               id: value[2],
                            //               quantity: int.parse(value[1])));
                            //         });
                            //       }
                            //     });
                            //   }
                            // }
                            // if (cake.isEmpty) {
                            //   if (eventBooking["CAKES"].isNotEmpty) {
                            //     eventBooking["CAKES"].forEach((key, value) {
                            //       if (!value.isEmpty) {
                            //         cake.add(Cakes(
                            //             id: value[2],
                            //             pound: int.parse(value[1])));
                            //       }
                            //     });
                            //   }
                            // }

                            // if (decoration.isEmpty) {
                            //   if (eventBooking["DECORATIONS"].isNotEmpty) {
                            //     eventBooking["DECORATIONS"]
                            //         .forEach((key, value) {
                            //       if (!value.isEmpty) {
                            //         decoration.add(value[1]);
                            //       }
                            //     });
                            //   }
                            // }

                            // debugPrint("Drink List ${decoration.toString()}");
                            // PaymentDetails paymentDetails =
                            //     eventBooking["CUSTOM_CAKE_IMAGE"] == null
                            //         ? PaymentDetails(
                            //             eventType: eventBooking["EVENT"],
                            //             venue: eventBooking["VENUE"]["id"],
                            //             theme: eventBooking["THEME"][1],
                            //             date: eventBooking["VENUE"]["Date"],
                            //             numberOfPeople: int.parse(
                            //                 eventBooking["VENUE"]
                            //                     ["No Of People"]),
                            //             drinks: drink,
                            //             cakes: cake,
                            //             decorations: decoration,
                            //           )
                            //         : PaymentDetails(
                            //             eventType: eventBooking["EVENT"],
                            //             venue: eventBooking["VENUE"]["id"],
                            //             theme: eventBooking["THEME"][1],
                            //             date: eventBooking["VENUE"]["Date"],
                            //             numberOfPeople: int.parse(
                            //                 eventBooking["VENUE"]
                            //                     ["No Of People"]),
                            //             drinks: drink,
                            //             cakes: cake,
                            //             decorations: decoration,
                            //             customCakeImage:
                            //                 eventBooking["CUSTOM_CAKE_IMAGE"],
                            //             customCakePound: int.parse(
                            //                 eventBooking["CUSTOM_CAKE_POUND"]),
                            //           );
                            // debugPrint("OKOKOKOK");
                            // _postTransaction(paymentDetails);

                            // // draftList.add(eventBooking);
                            // // storage.write("event", draftList);

                            // print("OKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK");
                            // displaySuccessMessage(context, "    Payment Success    ");
                            // var successsnackBar = const SnackBar(
                            //   content: Text(
                            //       'Payment Successful'),
                            //   duration: Duration(seconds: 15),
                            // );
                            // ScaffoldMessenger.of(context)
                            //     .showSnackBar(successsnackBar);
                            // // Navigator.pushNamed(context, "/chooseEvent");
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => const BottomNavBar(index: 3),
                            //   ),
                            // );
                          },
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {}, // Image tapped
                                splashColor:
                                    Colors.white10, // Splash color over image
                                child: Image.network(
                                  "https://us.123rf.com/450wm/lkeskinen/lkeskinen1611/lkeskinen161106352/66881121-projet-de-tampon-en-caoutchouc-conception-grunge-avec-des-rayures-de-poussi%C3%A8re-les-effets-peuvent-%C3%AAt.jpg",
                                  fit: BoxFit.contain, // Fixes border issues
                                  width: 63,
                                  height: 70,
                                ),
                              ),
                              const SizedBox(width: 7),
                              const Text(
                                "Pay Later",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Total amount",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "15000",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _displayMessage(bool isSuccess) {
    if (isSuccess) {
      for (var i = 0; i < draftList.length; i++) {
        if (draftList[i]["DRAFT_ID"] == eventBooking["DRAFT_ID"]) {
          draftList.removeAt(i);
        }
      }
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const BottomNavBar(index: 3),
        ),
      );
      displaySuccessMessage(context, "Payment Success");
    } else {
      // debugPrint("kakakakakakak");
      displayErrorMessage(context, "Error with the payment");
      // displaySuccessMessage(context, "Register Error");
    }
  }

  _postTransaction(PaymentDetails paymentDetails) async {
    bool isSuccess = await PaymentRepository().postTransaction(paymentDetails);
    debugPrint(isSuccess.toString());
    // bool isSuccess = true;
    if (isSuccess) {
      _displayMessage(true);
    } else {
      _displayMessage(false);
    }
  }
}
