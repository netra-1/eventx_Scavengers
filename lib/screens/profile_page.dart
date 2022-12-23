import 'dart:io';

import 'package:eventx/models/user/profile.dart';
import 'package:eventx/models/user/user_account.dart';
import 'package:eventx/repository/user_repository.dart';
import 'package:eventx/screens/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({Key? key}) : super(key: key);

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  Color blue = const Color.fromRGBO(11, 86, 222, 5);
  Color grey = Colors.grey;
  UserAccount? user;

  final _fullnameEditingController = TextEditingController();
  final _mobileEditingController = TextEditingController();
  final _emailEditingController = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

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
        // debugPrint(img!.toString());
      } else {
        return;
      }
    } catch (e) {
      debugPrint('Failed to pick Image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _globalKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "User Details",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 84, 90, 113),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          // SharedPreferences prefs =
                          //     await SharedPreferences.getInstance();
                          // prefs.clear();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/login', (Route<dynamic> route) => false);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 229, 24, 24),
                          ),
                          height: 30,
                          width: 100,
                          child: const Center(
                            child: Text(
                              "LogOut",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (user != null)
                    Stack(
                      children: [
                        SizedBox(
                          child: CircleAvatar(
                            backgroundImage: user!.profile!.image == null
                                ? const NetworkImage(
                                    "https://w.wallhaven.cc/full/v9/wallhaven-v9kw9l.jpg")
                                : NetworkImage(user!.profile!.image!),
                            radius: 80,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.grey[200],
                            ),
                            child: InkWell(
                              onTap: () => showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setStateProfile) {
                                      return showModalProfilePicture(
                                          setStateProfile);
                                    });
                                  }),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (user != null)
                    Container(
                      // height: 60,
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      alignment: Alignment.centerLeft,
                      // color: Colors.white,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 235, 235, 235)
                                .withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        // color: const Color.fromRGBO(11, 86, 222, 5),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Fullname",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(210, 118, 125, 152),
                            ),
                          ),
                          const SizedBox(height: 3),
                          // if (user != null &&
                          //     user!.fname != null &&
                          //     user!.lname != null)
                          Text(
                            user!.profile!.fullName!,
                            style: const TextStyle(
                              color: Color.fromRGBO(67, 67, 77, 0.9),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          
                        ],
                      ),
                    ),
                  const SizedBox(height: 15),
                  if (user != null)
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      alignment: Alignment.centerLeft,
                      // color: Colors.white,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 235, 235, 235)
                                .withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        // color: const Color.fromRGBO(11, 86, 222, 5),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(210, 118, 125, 152),
                            ),
                          ),
                          const SizedBox(height: 3),
                          // if (user != null && user!.email != null)
                          Text(
                            user!.email!,
                            style: const TextStyle(
                              color: Color.fromRGBO(67, 67, 77, 0.9),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Phone",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(210, 118, 125, 152),
                            ),
                          ),
                          const SizedBox(height: 3),
                          // if (user != null && user!.phone != null)
                          Text(
                            user!.profile!.phone == null
                                ? "Not Entered"
                                : user!.profile!.phone!,
                            style: const TextStyle(
                              color: Color.fromRGBO(67, 67, 77, 0.9),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Address",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(210, 118, 125, 152),
                            ),
                          ),
                          const SizedBox(height: 3),
                          // if (user != null && user!.address != null)
                          Text(
                            user!.profile!.address == null
                                ? "Not Entered"
                                : user!.profile!.address!.city!,
                            style: const TextStyle(
                              color: Color.fromRGBO(67, 67, 77, 0.9),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/pastEventsScreen');
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      alignment: Alignment.centerLeft,
                      // color: Colors.white,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 235, 235, 235)
                                .withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        // color: const Color.fromRGBO(11, 86, 222, 5),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "View Past Events",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(210, 49, 49, 49),
                            ),
                          ),
                          Icon(Icons.arrow_right_alt_outlined),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/editProfile');
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      alignment: Alignment.centerLeft,
                      // color: Colors.white,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 235, 235, 235)
                                .withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        // color: const Color.fromRGBO(11, 86, 222, 5),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "EditProfile",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(210, 49, 49, 49),
                            ),
                          ),
                          Icon(Icons.arrow_right_alt_outlined),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/changePassword');
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      alignment: Alignment.centerLeft,
                      // color: Colors.white,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 235, 235, 235)
                                .withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        // color: const Color.fromRGBO(11, 86, 222, 5),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Change Password",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(210, 49, 49, 49),
                            ),
                          ),
                          Icon(Icons.arrow_right_alt_outlined),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/savedDraft');
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      alignment: Alignment.centerLeft,
                      // color: Colors.white,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 235, 235, 235)
                                .withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        // color: const Color.fromRGBO(11, 86, 222, 5),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Saved Draft",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(210, 49, 49, 49),
                            ),
                          ),
                          Icon(Icons.arrow_right_alt_outlined),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/aboutUs');
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      alignment: Alignment.centerLeft,
                      // color: Colors.white,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 235, 235, 235)
                                .withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        // color: const Color.fromRGBO(11, 86, 222, 5),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "About Us",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(210, 49, 49, 49),
                            ),
                          ),
                          Icon(Icons.arrow_right_alt_outlined),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/contactUs');
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      alignment: Alignment.centerLeft,
                      // color: Colors.white,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 235, 235, 235)
                                .withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        // color: const Color.fromRGBO(11, 86, 222, 5),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Contact Us",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(210, 49, 49, 49),
                            ),
                          ),
                          Icon(Icons.arrow_right_alt_outlined),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/termsAndCondition');
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      alignment: Alignment.centerLeft,
                      // color: Colors.white,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 235, 235, 235)
                                .withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        // color: const Color.fromRGBO(11, 86, 222, 5),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Terms and condition",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(210, 49, 49, 49),
                            ),
                          ),
                          Icon(Icons.arrow_right_alt_outlined),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget showModalProfilePicture(StateSetter setStateSheet) {
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

  _navigateToScreen(bool isUpdated) async {
    if (isUpdated) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const BottomNavBar(index: 3),
        ),
      );
      MotionToast.success(description: const Text("Updated Successfully"))
          .show(context);
    } else {
      MotionToast.error(description: const Text("Invalid user credentials"))
          .show(context);
    }
  }

  _editProfile(Profile profile) async {
    try {
      UserRepository userRepository = UserRepository();

      bool isUpdated = await userRepository.updateProfile(profile);
      // bool isUpdated = true;
      if (isUpdated) {
        _navigateToScreen(true);
      } else {
        _navigateToScreen(false);
      }
    } catch (e) {
      MotionToast.error(description: Text("Error: ${e.toString()}"))
          .show(context);
    }
  }


}
