import 'package:eventx/models/drinks/drinks_model.dart';
import 'package:eventx/repository/event_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditDrinksScreen extends StatefulWidget {
  const EditDrinksScreen({Key? key}) : super(key: key);

  @override
  State<EditDrinksScreen> createState() => _EditDrinksScreenState();
}

class _EditDrinksScreenState extends State<EditDrinksScreen> {
  final _eventEditingController = TextEditingController();
  final _drinksController = TextEditingController();
  Map<int, dynamic> whiskeyQty = {};

  String searchQuery = "";

  List<List<String>> listEvent = [
    [
      "https://manofmany.com/wp-content/uploads/2022/08/jack-daniels-Bonded-1200x900.png",
      "Rs 000",
      "Jack Daniels"
    ],
    [
      "https://hungerend.com/wp-content/uploads/2022/06/gurkha-and-guns-750-ml.jpg",
      "Rs 2700",
      "Gurkhas And Guns"
    ],
    [
      "https://assets-api.kathmandupost.com/thumb.php?src=https://assets-cdn.kathmandupost.com/uploads/source/news/2022/third-party/ODdoublegoldweb-1652193007.jpg&w=900&height=601",
      "Rs 4500",
      "Old Durbar"
    ],
    [
      "https://gift-images.giftagram.com/1543791946.png",
      "Rs 23000",
      "Blue Lable"
    ],
    [
      "https://fatafatsewa.com/storage/media/3179/umA7A02706.jpg",
      "Rs 70",
      "Coca-Cola"
    ],
    [
      "https://m.media-amazon.com/images/I/51-r9pOh08L._SL1500_.jpg",
      "Rs 000",
      "Pepsi"
    ],
  ];
  var allDrinks;
  var drinkCategory;

  @override
  Widget build(BuildContext context) {
    var drinksType = ModalRoute.of(context)!.settings.arguments as Map;
    allDrinks = drinksType["allDrinks"];
    debugPrint("AllDrinnks$allDrinks");
    drinkCategory = drinksType["drinkCategory"];
    // debugPrint("Drink Category ${drinkCategory[0]}");
    // debugPrint("ASJSJSJSJSJJS ${allDrinks["DRINKS"]["WHISKEY"]}");
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
                      "Choose Drinks",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(118, 125, 152, 1),
                      ),
                    ),
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
                      hintText: "Enter a Drink Name",
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
                FutureBuilder<List<DrinksModel?>>(
                  future: EventRepository().loadDrinksType(drinkCategory[0]),
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
                            childAspectRatio: 90 / 155,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            // debugPrint(index.toString());
                            return snapshot.data![index]!.name!
                                    .toLowerCase()
                                    .contains(searchQuery.toLowerCase())
                                ? drinks(snapshot.data![index]!, index)
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
                        // if(allDrinks){}
                        // allDrinks["DRINKS"][drinkCategory[0].toString()] =
                        //     whiskeyQty;
                        debugPrint("ChooseDrinks: $allDrinks");
                        Navigator.pushNamed(
                          context,
                          '/editDrinksCategory',
                          arguments: allDrinks,
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

  Widget drinks(DrinksModel drinks, int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(2, 3), // changes position of shadow
            ),
          ],
        ),
        width: 195,
        height: 250,
        child: Column(
          children: [
            SizedBox(
              height: 160,
              width: double.infinity,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  drinks.image!.url!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          drinks.name!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Rs. ${drinks.price}",
                          style: const TextStyle(
                              color: Color.fromARGB(184, 24, 160, 121)),
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TextFormField(
              initialValue: allDrinks["DRINKS"][drinkCategory[0]].containsKey(index.toString())? allDrinks["DRINKS"][drinkCategory[0]][index.toString()][1]: "0",
              // initialValue: "0",
              // controller: _drinksController,
              onChanged: (value) {
                if (allDrinks["DRINKS"][drinkCategory[0]].containsKey(index.toString()) &&
                    int.parse(allDrinks["DRINKS"][drinkCategory[0]][index.toString()][1]) > 0) {
                  debugPrint("No. 1");
                  setState(() {
                    allDrinks["DRINKS"][drinkCategory[0]][index.toString()] = [drinks.name!, value, drinks.id];
                    if (value.isEmpty || int.parse(value) == 0) {
                      allDrinks["DRINKS"][drinkCategory[0]].remove(index.toString());
                    }
                  });
                } else if (value.isEmpty || int.parse(value) == 0) {
                  debugPrint("No. 2");

                  allDrinks["DRINKS"][drinkCategory[0]].remove(index.toString());
                } else {
                  debugPrint("No. 3");

                  final whiskey = <String, dynamic>{
                    index.toString(): [drinks.name!, value, drinks.id]
                  };
                  allDrinks["DRINKS"][drinkCategory[0]].addEntries(whiskey.entries);
                }
                debugPrint("Whiskey QTY:   ${allDrinks["DRINKS"][drinkCategory[0]]}");

                // else if(whiskeyQty.containsKey(index) && value.isEmpty){}
              },
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: "Enter quantity",
                filled: true,
                fillColor: const Color.fromARGB(255, 241, 241, 241),
                border: const UnderlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromARGB(0, 249, 192, 192)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
