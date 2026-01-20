import 'package:code_editor/model/chat_message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatProvider extends StateNotifier<List<ChatMessage>>{
  ChatProvider():super([]);

  void setMessage(ChatMessage message){
    state = [...state,message];
  }

}

final chatProvider = StateNotifierProvider<ChatProvider,List<ChatMessage>>((ref)=>ChatProvider());