import 'package:eventx/models/past_events/past_events.dart';
import 'package:eventx/repository/payment_repository.dart';
import 'package:flutter/material.dart';

class PastBookedEventsScreen extends StatefulWidget {
  const PastBookedEventsScreen({Key? key}) : super(key: key);

  @override
  State<PastBookedEventsScreen> createState() => _PastBookedEventsScreenState();
}

class _PastBookedEventsScreenState extends State<PastBookedEventsScreen> {
  List<PastEvents?> draftList = [];
  bool isRead = false;

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  void getUserDetails() async {
    List<PastEvents?> draftList1 = await PaymentRepository().loadPastEvents();
    debugPrint("User: $draftList1");

    setState(() {
      draftList = draftList1;
    });
  }
  // void readData(){
  //   draftList = storage.read(id!);
  // }

  @override
  Widget build(BuildContext context) {
    // debugPrint("Draft Listtttttttttttttttttt${draftList[0]["EVENT"]}");
    // debugPrint("Draft$draftList");

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
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
              const SizedBox(height: 50),
              draftList.isNotEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.86,
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 10);
                        },
                        itemCount: draftList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return draftBox(index);
                        },
                      ),
                    )
                  : const Center(
                      child: SizedBox(
                          child: Text("You have not yet booked event")))
            ],
          ),
        ),
      ),
    ));
  }

  Widget draftBox(int index) {
    return draftList.isNotEmpty
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
                      draftList[index]!.eventType.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      draftList[index]!.date.toString().split(" ")[0],
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
                          draftList[index]!.numberOfPeople.toString(),
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
                        Navigator.pushNamed(context, '/eventTrack');
                      },
                      child: const Text(
                        "Track Event",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                // InkWell(
                //   onTap: () {
                //   },
                //   child: SizedBox(
                //     height: 40,
                //     width: 40,
                //     child: CircleAvatar(
                //       // backgroundColor: Colors.white,
                //       backgroundColor: Colors.grey[100],

                //       child: const Center(
                //         child: Icon(
                //           Icons.delete_outlined,
                //           size: 25,
                //           color: Colors.red,
                //         ),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          )
        : Container();
  }
}
