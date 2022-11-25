import 'package:eventx/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ChooseDrinksCategoryScreen extends StatefulWidget {
  const ChooseDrinksCategoryScreen({Key? key}) : super(key: key);

  @override
  State<ChooseDrinksCategoryScreen> createState() =>
      _ChooseDrinksCategoryScreenState();
}

class _ChooseDrinksCategoryScreenState
    extends State<ChooseDrinksCategoryScreen> {
  final _eventEditingController = TextEditingController();
  // var whiskeyQty;
  var drinksCategory = {
    "WHISKEY": {},
    "VODKA": {},
    "SOFT": {},
    "GIN": {},
    "WINE": {},
    "BRANDY": {},
  };

  String searchQuery = "";
  var eventBooking = {};

  List<List<String>> listDrinksCategory = [
    [
      "https://manofmany.com/wp-content/uploads/2022/08/jack-daniels-Bonded-1200x900.png",
      "WHISKEY"
    ],
    [
      "https://assets-api.kathmandupost.com/thumb.php?src=https://assets-cdn.kathmandupost.com/uploads/source/news/2022/third-party/ODdoublegoldweb-1652193007.jpg&w=900&height=601",
      "VODKA"
    ],
    ["https://m.media-amazon.com/images/I/51-r9pOh08L._SL1500_.jpg", "SOFT"],
    [
      "https://hungerend.com/wp-content/uploads/2022/06/gurkha-and-guns-750-ml.jpg",
      "GIN"
    ],
    [
      "https://assets-api.kathmandupost.com/thumb.php?src=https://assets-cdn.kathmandupost.com/uploads/source/news/2022/third-party/ODdoublegoldweb-1652193007.jpg&w=900&height=601",
      "WINE"
    ],
    ["https://gift-images.giftagram.com/1543791946.png", "BRANDY"],
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void loadGetStorage()async{
    await GetStorage.init();
  }

  final storage = GetStorage();
  List<dynamic> draftList = [];

  @override
  Widget build(BuildContext context) {
    if(storage.read(id!) != null){
      draftList = storage.read(id!);
    }
    try {
      eventBooking = ModalRoute.of(context)!.settings.arguments as Map;
      debugPrint("NewDrinks$eventBooking");
    } catch (e) {
      debugPrint(e.toString());
    }
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
                      "Choose Drinks Category",
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
                      hintText: "Enter a Category Name",
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
                    itemCount: 6,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 90 / 90, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return listDrinksCategory[index][1]
                              .toLowerCase()
                              .contains(searchQuery.toLowerCase())
                          ? category(index)
                          : const SizedBox();
                    },
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      key: const ValueKey('btnLogin'),
                      onPressed: () {
                        for(var i= 0; i<draftList.length; i++){
                          if(draftList[i]["DRAFT_ID"] == eventBooking["DRAFT_ID"]){
                            draftList[i] = eventBooking;
                          }
                        }
                        storage.write(id!, draftList);

                        Navigator.pushNamed(
                          context,
                          '/chooseCakes',
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

  Widget category(int index) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () {
          // eventBooking["DRINKS"]["WHISKEY"] = [0,"ok"];
          debugPrint(eventBooking["DRINKS"].toString());
          Navigator.pushNamed(context, '/chooseDrinks',
              // arguments: [listDrinksCategory[index][1]],
              arguments: {
                "allDrinks": eventBooking,
                "drinkCategory": [listDrinksCategory[index][1]],
              });
        },
        child: Container(
          height: 142,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.13),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(2, 4), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    listDrinksCategory[index][1],
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Positioned(
                bottom: -17,
                right: -17,
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.red,
                  backgroundImage: NetworkImage(listDrinksCategory[index][0]),
                  foregroundColor: Colors.white,
                  // child: Text('24'),
                ), //CircularAvatar
              ),
            ],
          ),
        ),
      ),
    );
  }
}
