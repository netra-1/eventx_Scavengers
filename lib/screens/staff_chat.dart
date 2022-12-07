import 'package:eventx/models/chat/chat_model.dart';
import 'package:eventx/repository/chat_repository.dart';
import 'package:eventx/response/chat/staff_model.dart';
import 'package:eventx/screens/event_booking/eventx_chatpage.dart';
import 'package:flutter/material.dart';

class StaffChatPage extends StatefulWidget {
  // const StaffChatPage({Key key, this.chatModel, this.sourchat}) : super(key: key);
  const StaffChatPage({Key? key}) : super(key: key);

  @override
  State<StaffChatPage> createState() => _StaffChatPageState();
}

class _StaffChatPageState extends State<StaffChatPage> {
  

  List<StaffModel?> staffChatList = [];
  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  void getUserDetails() async {
    List<StaffModel?> staff1 = await ChatRepository().loadChat();
    // debugPrint("User: $staff1");

    setState(() {
      staffChatList = staff1;
    });
  }

  // List<dynamic> staffChatList = [
  //   [
  //     "https://manofmany.com/wp-content/uploads/2021/03/How-to-Look-Good-in-Photos-1200x900.jpeg",
  //     "Shishir Kandel",
  //     "Hey can i ask you that?",
  //     "12:05",
  //   ],
  //   [
  //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6ok5XIk7GuY8ZxH9HF8NklUhfCSP8saoxj1yNap0z&s",
  //     "Netra Budhathoki",
  //     "Ofcourse.",
  //     "12:09",
  //   ],
  //   [
  //     "https://i.pinimg.com/474x/cd/fd/8b/cdfd8b0e96c47cf2b320d893f94da64c.jpg",
  //     "Pasang Yangchen",
  //     "I dont get it.",
  //     "11:05",
  //   ],
  //   [
  //     "https://www.shutterstock.com/image-photo/portrait-ugly-woman-missing-teeth-260nw-191937224.jpg",
  //     "Prajwal Malakar",
  //     "What is that?",
  //     "09:05",
  //   ],
  // ];
  // final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: staffChatList.isNotEmpty? SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                itemCount: staffChatList.length,
                itemBuilder: (BuildContext context, int index) {
                  return staffAccount(index);
                },
              ),
            ),
          ),
        ),
      ):const Center(child: Text("None of the staff has taken your bookings yet"),),
    );
  }

  Widget staffAccount(int index) {
    return InkWell(
      onTap: () {
        ChatModel chatModel = ChatModel(
          id: staffChatList[index]!.id!,
          name: staffChatList[index]!.profile!.fullName!,
          image: staffChatList[index]!.image!.url!,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (contex) => EventXChatPage(chatModel: chatModel),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey,
              backgroundImage: NetworkImage(staffChatList[index]!.image!.url!),
            ),
            title: Text(
              staffChatList[index]!.profile!.fullName!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            // subtitle: Row(
            //   children: [
            //     const Icon(Icons.done_all),
            //     const SizedBox(
            //       width: 3,
            //     ),
            //     Text(
            //       staffChatList[index][2],
            //       style: const TextStyle(
            //         fontSize: 13,
            //       ),
            //     ),
            //   ],
            // ),
            // trailing: Text(staffChatList[index][3]),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
