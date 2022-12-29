
import 'package:eventxandroid/api/chat_api.dart';
import 'package:eventxandroid/models/chat/conversation_model.dart';
import 'package:eventxandroid/response/chat/staff_model.dart';

class ChatRepository {
  Future<bool> sendChat(String targetId, String msg) async {
    return ChatAPI().sendChat(targetId, msg);
  }

  Future<List<ConversationModel?>> loadConversation(String targetId)async{
    return ChatAPI().loadConversation(targetId);
  }

  Future<List<StaffModel?>> loadChat()async{
    return ChatAPI().loadChat();
  }
}
