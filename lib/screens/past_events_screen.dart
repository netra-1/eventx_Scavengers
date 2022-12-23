import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class PastEventsScreen extends StatefulWidget {
  const PastEventsScreen({Key? key}) : super(key: key);


  @override
  State<PastEventsScreen> createState() => _PastEventsScreenState();
}

class _PastEventsScreenState extends State<PastEventsScreen> {
  List<dynamic>? eventList = [];
  bool isRead = false;
  @override
  void initState() {
    loadGetStorage();
    // readData();
    super.initState();
  }

  void loadGetStorage() async {
    await GetStorage.init();
  }

  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    if (storage.read("event") == null) {
      debugPrint("NULL value");
      eventList = [];
    } else {
      eventList = storage.read("event");
      debugPrint("Not NULL value");
    }
    debugPrint("Draft Listtttttttttttttttttt${eventList![0]["EVENT"]}");
    debugPrint("Draft$eventList");

    return Scaffold(
            body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
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
                      "Booked Events",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(118, 125, 152, 1),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 10);
                      },
                      itemCount: eventList!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return draftBox(index);
                      },
                    ),
                  )
                ],
              ),
            ),
          ));
  }

  Widget draftBox(int index) {
    return eventList != null
        ? Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            // height: height * 0.13,
            width: double.infinity,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SizedBox(
                //   width: 0.0468 * width,
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 0.013 * MediaQuery.of(context).size.height,
                    ),
                    Text(
                      eventList![index]["EVENT"].toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      eventList![index]["THEME"].toString(),
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 0.013 * MediaQuery.of(context).size.height,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.people,
                          color: Colors.amber,
                          size: 18,
                        ),
                        Text(
                          eventList![index]["VENUE"]["No Of People"].toString(),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(38, 0, 185, 1)),
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/detailsScreenDraft',arguments: eventList![index]);
                      },
                      child: const Text(
                        "See Details",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(0, 116, 46, 1)),
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/eventTrack',arguments: eventList![index]);
                      },
                      child: const Text(
                        "Track Event",
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        : Container();
  }
}
