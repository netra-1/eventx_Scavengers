// import 'package:camera/camera.dart';
// import 'package:chatapp/Model/ChatModel.dart';
// import 'package:chatapp/Model/MessageModel.dart';
// import 'package:emoji_picker/emoji_picker.dart';
import 'package:eventxandroid/models/chat/chat_model.dart';
import 'package:eventxandroid/models/chat/conversation_model.dart';
import 'package:eventxandroid/models/chat/message_model.dart';
import 'package:eventxandroid/repository/chat_repository.dart';
import 'package:eventxandroid/screens/widgets/own_message_card.dart';
import 'package:eventxandroid/screens/widgets/reply_card.dart';
import 'package:eventxandroid/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class EventXChatPage extends StatefulWidget {
  final ChatModel chatModel;
  const EventXChatPage({Key? key, required this.chatModel}) : super(key: key);

  // const EventXChatPage({Key key, this.chatModel, this.sourchat}) : super(key: key);
  // final ChatModel chatModel;
  // final ChatModel sourchat;

  @override
  State<EventXChatPage> createState() => _EventXChatPageState();
}

class _EventXChatPageState extends State<EventXChatPage> {
  // final IO.Socket socket = IO.io("http://10.0.0.2:8000",
  //     IO.OptionBuilder().setTransports(["websocket"]).build());
  // Socket socket = io('http://localhost:8000',
  //   OptionBuilder()
  //     .setTransports(['websocket']) // for Flutter or Dart VM
  //     .disableAutoConnect()  // disable auto-connection
  //     .setExtraHeaders({'foo': 'bar'}) // optional
  //     .build()
  // );
  // IO.Socket socket = IO.io('http://10.0.0.2:8000', <String, dynamic>{
  //   'transports': ['websocket'],
  //    'timeout': 5000,
  // });

  IO.Socket? socket;

  List<ConversationModel?> conversation = [];
  void connect() {
    // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
    socket = IO.io("http://192.168.101.8:8011", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
      'forceNew': true,
    });
    socket!.connect();
    socket!.emit("add-user", id!);

    socket!.onConnect((data) {
      print("Connected");
      socket!.on("msg-receive", (msg) {
        debugPrint("Message${msg['message']}");
        debugPrint("skskskskskskskskskskskskkssksk${msg['message']}");

        setMessage(false, msg["message"]);
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    socket!.onConnectTimeout((data) => print("Error timeout::: $data"));
    socket!.onConnectError((data) => print("Error Error $data"));
    print("Socket${socket!.connected}");
  }
  //ss

  @override
  void initState() {
    super.initState();
    getUserDetails();
    connect();
    // connect();

    // focusNode.addListener(() {
    //   if (focusNode.hasFocus) {
    //     setState(() {
    //       show = false;
    //     });
    //   }
    // });
    // debugPrint("CONNNNNNN");
  }

  void getUserDetails() async {
    List<ConversationModel?> conversation1 =
        await ChatRepository().loadConversation("639ec388f8b66a38352399a5");
    debugPrint("User: $conversation1");

    setState(() {
      conversation = conversation1;
    });
  }

  List<String> chats = ["Hey, can i ask you that?"];
  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;
  List<MessageModel> messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  // @override
  // void initState() {
  //   super.initState();
  //   // connect();

  //   focusNode.addListener(() {
  //     if (focusNode.hasFocus) {
  //       setState(() {
  //         show = false;
  //       });
  //     }
  //   });
  //   connect();
  // }

  void sendMessage(String message, String sourceId, String targetId) async {
    debugPrint("From: $sourceId................ To: $targetId");
    bool isSent = await ChatRepository().sendChat(targetId, message);
    setMessage(true, message);
    socket!.emit(
        "send-msg", {"message": message, "from": sourceId, "to": targetId});
  }

  void setMessage(bool senderSelf, String message) {
    ConversationModel conversationModel = ConversationModel(
        senderSelf: senderSelf,
        message: message,
        createdAt: DateTime.now().toString());
    print(messages);

    setState(() {
      conversation.add(conversationModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.network(
        //   "https://ichef.bbci.co.uk/news/999/cpsprodpb/15951/production/_117310488_16.jpg",
        //   height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width,
        //   fit: BoxFit.cover,
        // ),
        Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              leadingWidth: 70,
              titleSpacing: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(widget.chatModel.image!),
                      // child: Image.network(
                      //   // widget.chatModel.isGroup
                      //   //     ? "assets/groups.svg"
                      //   //     : "assets/person.svg",
                      //   "https://ichef.bbci.co.uk/news/999/cpsprodpb/15951/production/_117310488_16.jpg",
                      //   color: Colors.white,
                      //   height: 36,
                      //   width: 36,
                      // ),
                    ),
                  ],
                ),
              ),
              title: InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // widget.chatModel.name,
                        widget.chatModel.name!,
                        style: const TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // const Text(
                      //   "last seen today at 12:05",
                      //   style: TextStyle(
                      //     fontSize: 13,
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Column(
                children: [
                  // FutureBuilder<List<ConversationModel?>>(
                  //   future:
                  //       ChatAPI().loadConversation("639ec388f8b66a38352399a5"),
                  //   builder: (context, snapshot) {
                  //     // debugPrint("Data:::::${snapshot.data!.length}");
                  //     // debugPrint("Data:::::${snapshot.data![0]!.name}");

                  //     if (snapshot.hasData) {
                  //       return Expanded(
                  //         // height: MediaQuery.of(context).size.height * 0.7,
                  //         child: ListView.builder(
                  //           shrinkWrap: true,
                  //           controller: _scrollController,
                  //           // itemCount: messages.length + 1,
                  //           itemCount: snapshot.data!.length,
                  //           itemBuilder: (context, index) {
                  //             if (index == snapshot.data!.length-1) {
                  //               return Container(
                  //                 height: 70,
                  //               );
                  //             }
                  //             // if ("messages[index].type" == "source") {
                  //             if (snapshot.data![index]!.senderSelf!) {
                  //               return OwnMessageCard(
                  //                 // message: "messages[index].message",
                  //                 // time: "messages[index].time",
                  //                 message: snapshot.data![index]!.message!,
                  //                 time: "68:68",
                  //               );
                  //             } else {
                  //               return ReplyCard(
                  //                 message: snapshot.data![index]!.message!,
                  //                 time: "09:26",
                  //               );
                  //             }
                  //           },
                  //         ),
                  //       );
                  //     } else if (snapshot.hasError) {
                  //       return const Text("Error");
                  //     } else {
                  //       return const Center(child: CircularProgressIndicator());
                  //     }
                  //   },
                  // ),
                  Expanded(
                    // height: MediaQuery.of(context).size.height - 150,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 50),
                      shrinkWrap: true,
                      controller: _scrollController,
                      // itemCount: messages.length + 1,
                      itemCount: conversation.length,
                      itemBuilder: (context, index) {
                        if (index == 9) {
                          return Container(
                            height: 70,
                          );
                        }
                        // if ("messages[index].type" == "source") {
                        if (conversation[index]!.senderSelf!) {
                          DateTime date = DateTime.parse(conversation[index]!.createdAt!.toString());
                          return OwnMessageCard(
                            // message: "messages[index].message",
                            // time: "messages[index].time",
                            message: conversation[index]!.message!,
                            time: "${date.hour}:${date.minute}",
                          );
                        } else {
                          return ReplyCard(
                            message: conversation[index]!.message!,
                            time: "09:26",
                          );
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Card(
                                  margin: const EdgeInsets.only(
                                      left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: TextFormField(
                                    controller: _controller,
                                    focusNode: focusNode,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        setState(() {
                                          sendButton = true;
                                        });
                                      } else {
                                        setState(() {
                                          sendButton = false;
                                        });
                                      }
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type a message",
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
                                      prefixIcon: const SizedBox(),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [SizedBox()],
                                      ),
                                      contentPadding: const EdgeInsets.all(5),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 8,
                                  right: 2,
                                  left: 2,
                                ),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: const Color(0xFF128C7E),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.send,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      if (sendButton) {
                                        // chats.add(_controller.text);
                                        // _controller.clear();

                                        sendMessage(
                                          _controller.text,
                                          id!,
                                          widget.chatModel.id!,
                                          // "639ec388f8b66a38352399a5",
                                        );
                                        _scrollController.animateTo(
                                            _scrollController
                                                .position.maxScrollExtent,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeOut);
                                        _controller.clear();
                                        setState(() {
                                          sendButton = false;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          show ? emojiSelect() : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  // Widget bottomSheet() {
  //   return SizedBox(
  //     height: 278,
  //     width: MediaQuery.of(context).size.width,
  //     child: Card(
  //       margin: const EdgeInsets.all(18.0),
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
  //         child: Column(
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 iconCreation(
  //                     Icons.insert_drive_file, Colors.indigo, "Document"),
  //                 const SizedBox(
  //                   width: 40,
  //                 ),
  //                 iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
  //                 const SizedBox(
  //                   width: 40,
  //                 ),
  //                 iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
  //               ],
  //             ),
  //             const SizedBox(
  //               height: 30,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 iconCreation(Icons.headset, Colors.orange, "Audio"),
  //                 const SizedBox(
  //                   width: 40,
  //                 ),
  //                 iconCreation(Icons.location_pin, Colors.teal, "Location"),
  //                 const SizedBox(
  //                   width: 40,
  //                 ),
  //                 iconCreation(Icons.person, Colors.blue, "Contact"),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget iconCreation(IconData icons, Color color, String text) {
  //   return InkWell(
  //     onTap: () {},
  //     child: Column(
  //       children: [
  //         CircleAvatar(
  //           radius: 30,
  //           backgroundColor: color,
  //           child: Icon(
  //             icons,
  //             // semanticLabel: "Help",
  //             size: 29,
  //             color: Colors.white,
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 5,
  //         ),
  //         Text(
  //           text,
  //           style: const TextStyle(
  //             fontSize: 12,
  //             // fontWeight: FontWeight.w100,
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget emojiSelect() {
    // return EmojiPicker(
    //     rows: 4,
    //     columns: 7,
    //     onEmojiSelected: (emoji, category) {
    //       print(emoji);
    //       setState(() {
    //         _controller.text = _controller.text + emoji.emoji;
    //       });
    //     });
    return const SizedBox();
  }
}
