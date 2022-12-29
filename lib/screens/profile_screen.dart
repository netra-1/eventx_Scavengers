import 'package:eventxandroid/models/user/user_account.dart';
import 'package:eventxandroid/repository/user_repository.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserAccount? user;
  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  void getUserDetails() async {
    UserAccount? user1 = await UserRepository().viewProfile();
    debugPrint("User: $user1");

    setState(() {
      user = user1!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              color: const Color.fromRGBO(45, 21, 139, 1),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(13.0, 30, 13, 13),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.settings, size: 40, color: Colors.white),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 26),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height - 300,
                color: const Color.fromARGB(255, 242, 242, 242),
              ),
            ),
            Positioned(
              top: 100,
              left: 15,
              width: MediaQuery.of(context).size.width - 30,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - 150,
                  decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: const Color.fromARGB(255, 233, 233, 233)
                    //         .withOpacity(0.5),
                    //     spreadRadius: 5,
                    //     blurRadius: 7,
                    //     offset:
                    //         const Offset(0, 3), // changes position of shadow
                    //   ),
                    // ],  
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: user != null
                      ? SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: user!.image == null
                                        ? const NetworkImage(
                                            "https://w.wallhaven.cc/full/v9/wallhaven-v9kw9l.jpg")
                                        : NetworkImage(user!.image!.url!),
                                    radius: 25,
                                  ),
                                  title: Text(
                                    user!.profile!.fullName!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                              const Divider(
                                thickness: 0.5,
                                color: Color.fromARGB(255, 142, 142, 142),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(27.0, 16, 8, 12),
                                child: Text(
                                  "Account Settings",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Color.fromRGBO(173, 173, 173, 1)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/editProfile');
                                  },
                                  child: const ListTile(
                                    leading: Text(
                                      "Edit Profile",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                    trailing: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 18),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/changePassword');
                                  },
                                  child: const ListTile(
                                    leading: Text(
                                      "Change Password",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                    trailing: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 18),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/pastEventsScreen');
                                  },
                                  child: const ListTile(
                                    leading: Text(
                                      "Booked Events",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                    trailing: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 18),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/savedDraft');
                                  },
                                  child: const ListTile(
                                    leading: Text(
                                      "Draft Events",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                    trailing: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 18),
                                  ),
                                ),
                              ),
                              const Divider(
                                thickness: 0.5,
                                color: Color.fromARGB(255, 142, 142, 142),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(27.0, 8, 8, 8),
                                child: Text(
                                  "More",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Color.fromRGBO(173, 173, 173, 1)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/aboutUs');
                                  },
                                  child: const ListTile(
                                    leading: Text(
                                      "About Us",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                    trailing: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 18),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/contactUs');
                                  },
                                  child: const ListTile(
                                    leading: Text(
                                      "Contact Us",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                    trailing: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 18),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/termsAndCondition');
                                  },
                                  child: const ListTile(
                                    leading: Text(
                                      "Terms And Condition",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                    trailing: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 18),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil('/login',
                                            (Route<dynamic> route) => false);
                                  },
                                  child: const ListTile(
                                    leading: Text(
                                      "LogOut",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: Colors.red),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 18,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 50)
                            ],
                          ),
                        )
                      : Column(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
