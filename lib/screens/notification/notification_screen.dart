import 'package:eventx/models/announcement/announcement_model.dart';
import 'package:eventx/repository/announcement_repository.dart';
import 'package:eventx/screens/bottom_nav_bar.dart';
import 'package:eventx/utils/display_message.dart';
import 'package:eventx/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:motion_toast/motion_toast.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<dynamic>? draftList = [];
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

  // void readData(){
  //   draftList = storage.read(id!);
  // }

  @override
  Widget build(BuildContext context) {
    if (storage.read(id!) == null) {
      setState(() {
        debugPrint("NULL value");
        draftList = [];
      });
    } else {
      setState(() {
        draftList = storage.read(id!);
        debugPrint("Not NULL value");
      });
    }
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    // color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const BottomNavBar(index: 0,),
                        ),
                      );
                    },
                  ),
                  const Text(
                    "Notifications",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(),
                  const SizedBox(),
                ],
              ),
              const SizedBox(height: 20),
              FutureBuilder<List<AnnouncementModel?>>(
                future: AnnouncementRepository().loadAnnouncement(),
                builder: (context, snapshot) {
                  // debugPrint("Data:::::${snapshot.data!.length}");
                  // debugPrint("Data:::::${snapshot.data![0]!.name}");

                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton.icon(
                              onPressed: () {
                                for (var i = 0;
                                    i < snapshot.data!.length;
                                    i++) {
                                  _readAllAnnouncement(snapshot.data![i]!.id!);
                                }

                                _displayMessage(true);
                              },
                              label: const Text('Mark as all read'),
                              icon: const Icon(
                                Icons.check_circle_outline_rounded,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Divider(
                                      // color: snapshot.data![index]!.read!? Colors.blueAccent : Colors.grey,
                                      thickness: 1,
                                    ),
                                  ),
                                  // SizedBox(height: 10)
                                ],
                              );
                            },
                            itemCount: snapshot.data!.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              // debugPrint(index.toString());
                              return notificationBox(
                                  snapshot.data![index]!, index);
                            },
                          ),
                        ),
                      ],
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
    ));
  }

  _displayMessage(bool isSignup) {
    if (isSignup) {
      Navigator.pushNamed(context, '/notificationScreen');
      // displaySuccessMessage(context, "Register Success");
    } else {
      // debugPrint("kakakakakakak");
      displayErrorMessage(context, "Error registering user");
      // displaySuccessMessage(context, "Register Error");
    }
  }

  _readAllAnnouncement(String announcementId) async {
    try {
      AnnouncementRepository announcementRepository = AnnouncementRepository();
      bool isLogin =
          await announcementRepository.readAnnouncement(announcementId);
      // bool isLogin = true;
    } catch (e) {
      MotionToast.error(description: Text("Error: ${e.toString()}"))
          .show(context);
    }
  }

  _readAnnouncement(String announcementId) async {
    try {
      AnnouncementRepository announcementRepository = AnnouncementRepository();
      bool isLogin =
          await announcementRepository.readAnnouncement(announcementId);
      // bool isLogin = true;
      if (isLogin) {
        _displayMessage(true);
      } else {
        _displayMessage(false);
      }
    } catch (e) {
      MotionToast.error(description: Text("Error: ${e.toString()}"))
          .show(context);
    }
  }

  Widget notificationBox(AnnouncementModel announcementModel, int index) {
    return draftList != null && draftList!.isNotEmpty
        ? InkWell(
            onTap: () {
              if (!announcementModel.read!) {
                _readAnnouncement(announcementModel.id!);
              }
            },
            child: ListTile(
              leading: const CircleAvatar(
                radius: 31,
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-vector/golden-christmas-bell_23-2147500635.jpg?w=996&t=st=1672646143~exp=1672646743~hmac=aa6c827c66112203d1fb6833ed9dc2f96bd1e3587bc47a58d936c6c7aab53c38"),
              ),
              title: Text(
                announcementModel.title!,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    announcementModel.message!,
                    style:
                        const TextStyle(color: Color.fromARGB(255, 59, 59, 59)),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Yesterday at 11:42 pm",
                        style: TextStyle(
                            color: announcementModel.read!
                                ? const Color.fromARGB(255, 138, 138, 138)
                                : Colors.blueAccent),
                      ),
                      if (!announcementModel.read!)
                        Container(
                          // margin: const EdgeInsets.all(8.0),
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                              color: Colors.blueAccent, shape: BoxShape.circle),
                        )
                    ],
                  ),
                ],
              ),
              // trailing: IconButton(
              //     onPressed: () {},
              //     icon: const Icon(Icons.check_circle_rounded)),
            ),
          )
        : Container();
  }
}
