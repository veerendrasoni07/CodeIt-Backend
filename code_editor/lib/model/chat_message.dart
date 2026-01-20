// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatMessage {
  final String role;
  final String text;

  ChatMessage({required this.role, required this.text});



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'role': role,
      'text': text,
    };
  }

  factory ChatMessage.fromJson(Map<String, dynamic> map) {
    return ChatMessage(
      role: map['role'] as String,
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

}
