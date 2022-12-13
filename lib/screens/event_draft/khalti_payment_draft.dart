import 'package:eventx/models/payment/items_details.dart';
import 'package:eventx/screens/bottom_nav_bar.dart';
import 'package:eventx/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class KhaltiPaymentDraftScreen extends StatefulWidget {
  const KhaltiPaymentDraftScreen({Key? key}) : super(key: key);

  @override
  State<KhaltiPaymentDraftScreen> createState() => _KhaltiPaymentDraftScreenState();
}

class _KhaltiPaymentDraftScreenState extends State<KhaltiPaymentDraftScreen> {
    List<dynamic>? draftList = [];
    List<dynamic>? eventList = [];
  final _amountController = TextEditingController();
  @override
  void initState() {
    _amountController.text = 10.toString();
    // loadGetStorage();
    super.initState();
  }

  getAmt() {
    // return int.parse(_amountController.text) * 100; // Converting to paisa
    return int.parse(_amountController.text) * 100;
  }
  // void loadGetStorage() async {
  //   await GetStorage.init();
  // }
  final storage = GetStorage();

  List<Items?> drink = [];
  List<Items?> cake = [];
  List<String?> decoration = [];

  var eventBooking;
  var allData;
  var index;
  @override
  Widget build(BuildContext context) {
    allData = ModalRoute.of(context)!.settings.arguments as Map;
    eventBooking = allData["eventBooking"];
    index = allData["index"];

    draftList = storage.read(id!);
    eventList = storage.read("event");

    draftList ??= []; 
    eventList ??= [];

    debugPrint(index.toString());
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: ListView(
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
                    "Khalti Payment",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(118, 125, 152, 1),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              // For Amount
              TextField(
                readOnly: true,
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Enter Amount to pay",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    )),
              ),
              const SizedBox(
                height: 8,
              ),
              // For Button
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.red)),
                  height: 50,
                  color: const Color(0xFF56328c),
                  child: const Text(
                    'Pay With Khalti',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  onPressed: () {
                    KhaltiScope.of(context).pay(
                      config: PaymentConfig(
                        amount: getAmt(),
                        productIdentity: 'dells-sssssg5-g5510-2021',
                        productName: 'Product Name',
                      ),
                      preferences: [
                        PaymentPreference.khalti,
                      ],
                      onSuccess: (su) {
                        eventList!.add(draftList![index]);
                        storage.write("event", eventList);
                        draftList!.removeAt(index);
                        storage.write(id!, draftList);
                        // debugPrint("${eventBooking["DRINKS"]}");
                        // eventBooking["DRINKS"].forEach((key, value) {
                        //   // debugPrint("Key $key and Value $value");
                        //   if (!value.isEmpty) {
                        //     value.forEach((key, value) {
                        //       drink.add(Items(id: value[2], qty: value[1]));
                        //     });
                        //   }
                        // });
                        // eventBooking["CAKES"].forEach((key, value) {
                        //   if (!value.isEmpty) {
                        //     cake.add(Items(id: value[2], qty: value[1]));
                        //   }
                        // });

                        // decoration.add(eventBooking["DECORATION"]);

                        // debugPrint(drink.toString() + drink.length.toString());
                        debugPrint("Success Payssssssssssssssssssssss: ");
                        // PaymentDetails paymentDetails = PaymentDetails(
                        //   token: su.token,
                        //   idx: su.idx,
                        //   amount: eventBooking["TOTAL"],
                        //   event: eventBooking["EVENT"],
                        //   venue: eventBooking["VENUE"],
                        //   theme: eventBooking["THEME"],
                        //   drinks: drink,
                        //   cakes: cake,
                        //   decoration: decoration,
                        // );
                        print("OKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK");
                        var successsnackBar = SnackBar(
                          content: Text(
                              'Payment Successful${su.token}, ${su.additionalData},${su.idx}'),
                          duration: const Duration(seconds: 15),
                        );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(successsnackBar);
                        // Navigator.pushNamed(context, "/chooseEvent");
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const BottomNavBar(index: 0),
                          ),
                        );
                      },
                      onFailure: (fa) {
                        const failedsnackBar = SnackBar(
                          content: Text('Payment Failed'),
                        );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(failedsnackBar);
                      },
                      onCancel: () {
                        const cancelsnackBar = SnackBar(
                          content: Text('Payment Cancelled'),
                        );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(cancelsnackBar);
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
