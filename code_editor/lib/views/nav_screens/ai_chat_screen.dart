import 'package:code_editor/controller/gemini_controller.dart';
import 'package:code_editor/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AiChatScreen extends ConsumerStatefulWidget {
  const AiChatScreen({super.key});

  @override
  ConsumerState<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends ConsumerState<AiChatScreen> {
  
  TextEditingController controller = TextEditingController();
  final GeminiController geminiController = GeminiController();

  Future<void> askAI()async{
    final question = controller.text.trim();
    await geminiController.getAIResponse(question: question,ref: ref);
  }
  
  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(chatProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dotted AI",
          style: GoogleFonts.montserrat(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 3
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: messages.length,
                  itemBuilder: (context,index){
                  final message = messages[index];
                  bool isUser = message.role == 'user';
                    return Align(
                      alignment: isUser ? Alignment.topLeft : Alignment.topRight,
                      child: Container(
                        child: Text(message.text),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.shade200
                        ),
                      ),
                    );
                  }
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: askAI,
                  icon: Icon(Icons.send,size: 35,),
                ),
                hintText: "Type Something",
                fillColor: Colors.grey,
                filled: true,
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              )
            ),
          )
        ],
      ),
    );
  }
}
