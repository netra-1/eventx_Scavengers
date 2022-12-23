import 'package:eventx/models/announcement/announcement_model.dart';
import 'package:eventx/repository/announcement_repository.dart';
import 'package:eventx/screens/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
// import 'package:hospital_management_system/models/highest_booked_department.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchEditingController = TextEditingController();
  double height = 0.0;
  double width = 0.0;

  List<AnnouncementModel?> announcement = [];

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  void getUserDetails() async {
    List<AnnouncementModel?> announcement1 =
        await AnnouncementRepository().loadAnnouncement();
    debugPrint("User: $announcement1");

    setState(() {
      announcement = announcement1;
    });
  }

  bool newNotifications = false;

  // List<HighestBookedDepartment> showDepart = [
  //   HighestBookedDepartment(
  //       "https://w.wallhaven.cc/full/x8/wallhaven-x8gkvz.jpg", "Heart Surgeon"),
  //   HighestBookedDepartment("", "General Ward"),
  //   HighestBookedDepartment("", "Dental"),
  // ];
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < announcement.length; i++) {
      if (announcement[i]!.read == false) {
        setState(() {
          newNotifications = true;
        });
      }
    }
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 255),
      // (255, 245, 250, 255), // (250, 250, 255, 1)
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0),
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          " Goodmorning, Shishir",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(202, 202, 209, 1),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Plan your event here",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(67, 78, 97, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/notificationScreen');
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 188, 188, 188),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Icon(
                              color: Colors.blueAccent,
                              Icons.notifications,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      if (newNotifications)
                        Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              // margin: const EdgeInsets.all(8.0),
                              height: 10,
                              width: 10,
                              decoration: const BoxDecoration(
                                  color: Colors.blueAccent,
                                  shape: BoxShape.circle),
                            ))
                    ],
                  ),
                ],
              ),

              SizedBox(
                height: height * 0.03,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, '/doctorDepartmentScreen');
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25, 5, 0, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      Center(
                        child: Text(
                          "Search Event",
                          style: TextStyle(
                              color: Color.fromARGB(255, 192, 192, 192),
                              // fontWeight: FontWeight.w300,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.008,
              ),
              const Divider(color: Color.fromARGB(255, 174, 172, 172)),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(11, 86, 222, 5),
                ),
                // height: height * 0.2,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                              // height: height * 0.135,
                              // width: width * 0.56,
                              child: const Text(
                                "Remember to always plan your event before you start.",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          // const SizedBox(
                          //   height: 6,
                          // ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                              // height: height * 0.11,
                              // width: width * 0.2,
                              child: const CircleAvatar(
                                radius: 45,
                                backgroundImage: NetworkImage(
                                    "https://thumbs.dreamstime.com/b/event-planning-working-desk-notebook-events-word-computer-pencil-notepad-clock-concept-98612010.jpg"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 10),

                      // alignment: Alignment.centerLeft,
                      // height: height * 0.017,
                      // width: 100,
                      // padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: const Text(
                        "#PlanYourEvent",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              // SizedBox(
              //   height: 50,
              //   width: double.infinity,
              //   child: Flex(direction: Axis.horizontal, children: [
              //     Expanded(
              //       child: ListView.separated(
              //         scrollDirection: Axis.horizontal,
              //         itemCount: showDepart.length,
              //         separatorBuilder: (BuildContext context, int index) =>
              //             SizedBox(width: width * 0.09),
              //         itemBuilder: (BuildContext context, index) {
              //           return InkWell(
              //             onTap: () {},
              //             child: Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: Container(
              //                 padding: const EdgeInsets.fromLTRB(5, 3, 10, 3),

              //                 decoration: BoxDecoration(
              //                   boxShadow: [
              //                     BoxShadow(
              //                       color:
              //                           const Color.fromARGB(255, 233, 233, 233)
              //                               .withOpacity(0.5),
              //                       spreadRadius: 5,
              //                       blurRadius: 7,
              //                       offset: const Offset(
              //                           0, 3), // changes position of shadow
              //                     ),
              //                   ],
              //                   borderRadius: BorderRadius.circular(20),
              //                   // color: const Color.fromRGBO(11, 86, 222, 5),
              //                   color: Colors.white,
              //                 ),
              //                 // height: height * 0.052,
              //                 // width: width * 0.405,
              //                 child: Row(
              //                   children: const [
              //                     SizedBox(
              //                       child: CircleAvatar(
              //                           radius: 15,
              //                           backgroundImage: NetworkImage(
              //                               "https://w.wallhaven.cc/full/x8/wallhaven-x8gkvz.jpg")),
              //                     ),
              //                     Text(
              //                       " Heart Surgeon",
              //                       style: TextStyle(
              //                         fontWeight: FontWeight.w500,
              //                         fontSize: 11,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           );
              //         },
              //       ),
              //     ),
              //   ]),
              // ),
              // const SizedBox(height: 20),
              // SizedBox(
              //   width: double.infinity,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: const [
              //       Text(
              //         "Booked Events",
              //         style: TextStyle(
              //           fontWeight: FontWeight.w900,
              //           color: Color.fromARGB(255, 36, 58, 96),
              //           fontSize: 16,
              //         ),
              //       ),
              //       Text(
              //         "See all",
              //         style: TextStyle(
              //           fontWeight: FontWeight.w600,
              //           color: Color.fromRGBO(11, 86, 222, 5),
              //           fontSize: 13,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 20),
              // Container(
              //   padding: const EdgeInsets.all(20),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20),
              //     color: const Color.fromRGBO(11, 86, 222, 5),
              //   ),
              //   width: double.infinity,
              //   child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           Expanded(
              //             flex: 17,
              //             child: Container(
              //               height: 50,
              //               width: 50,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(16),
              //                 image: const DecorationImage(
              //                     image: NetworkImage(
              //                         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvg6rpN-PxRwhR0M_6KuwLsByOe54eM0GF7qyMhr2b&s"),
              //                     fit: BoxFit.cover),
              //               ), // Foreground widget here
              //             ),
              //           ),
              //           const SizedBox(
              //             width: 10,
              //           ),
              //           Expanded(
              //             flex: 73,
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: const [
              //                 Text(
              //                   "Birthday",
              //                   style: TextStyle(
              //                     color: Colors.white,
              //                     fontWeight: FontWeight.w500,
              //                   ),
              //                 ),
              //                 Text(
              //                   "World Class Venue",
              //                   style: TextStyle(
              //                     color: Color.fromARGB(255, 182, 195, 255),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //           const Expanded(
              //             flex: 10,
              //             child: SizedBox(
              //               height: 30,
              //               width: 30,
              //               child: CircleAvatar(
              //                 backgroundColor: Colors.white,
              //                 child: Center(
              //                   child: Icon(Icons.message_outlined, size: 14),
              //                 ),
              //               ),
              //             ),
              //           )
              //         ],
              //       ),
              //       const SizedBox(
              //         height: 10,
              //       ),
              //       Container(
              //         width: double.infinity,
              //         padding: const EdgeInsets.all(24),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(20),
              //           color: const Color.fromARGB(248, 0, 71, 203),
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: const [
              //             Icon(
              //               Icons.lock_clock,
              //               color: Color.fromARGB(255, 145, 161, 240),
              //             ),
              //             Text(
              //               "Sun, Jan19, 2022",
              //               style: TextStyle(
              //                 color: Colors.white,
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Our top Events",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 36, 58, 96),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(11, 86, 222, 5),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                // height: height * 0.13,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 233, 233, 233)
                          .withOpacity(0.5),
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
                              "https://media.istockphoto.com/id/171259492/photo/wedding-reception.jpg?s=612x612&w=0&k=20&c=UBIYFKpUBUT2Yo4eK5vF9GTam69uTKqFvScxWShoEGw="),
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
                            height: 0.013 * height,
                          ),
                          const Text(
                            "Pre Wedding",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            "Diva Banquet",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 0.013 * height,
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              Text(
                                "4.5",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "| 120 Reviews",
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
              SizedBox(
                height: 0.0195 * height,
              ),
              const Divider(
                color: Color.fromARGB(255, 174, 172, 172),
              ),
              SizedBox(
                height: 0.0195 * height,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BottomNavBar(index: 1),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromRGBO(11, 86, 222, 5),
                  ),
                  height: 70,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      "Plan Event",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
