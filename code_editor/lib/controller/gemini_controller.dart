import 'dart:convert';

import 'package:code_editor/global_variable.dart';
import 'package:code_editor/model/chat_message.dart';
import 'package:code_editor/provider/chat_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
class GeminiController{
  Future<String> getAIResponse({required String question,required WidgetRef ref})async{
    try{
      ref.read(chatProvider.notifier).setMessage(ChatMessage(role: 'user', text: question));
      http.Response  response = await http.post(
          Uri.parse('$uri/api/run'),
        body: jsonEncode(
          {
            'question':question
          }
        ),
        headers: <String,String>{
            'Content-Type':'application/json; charset=UTF-8'
        },
      );
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        ref.read(chatProvider.notifier).setMessage(ChatMessage(role: 'ai', text: data['result']));
        return data['result'];
      }
      else{
        return "Error occurred due to:${response.statusCode}";
      }
    }catch(e){
      return "Error occurred due to:$e";
    }
  }


}