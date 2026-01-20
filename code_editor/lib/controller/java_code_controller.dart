import 'dart:convert';

import 'package:code_editor/global_variable.dart';
import 'package:http/http.dart' as http;

class JavaCodeController{
  Future<Map<String,dynamic>> runCode(String code,String input)async{
    try{
      http.Response response = await http.post(
          Uri.parse('$uri/api/run-java'),
          body: jsonEncode(
              {
                'code':code,
                'input':input
              }
          ),
          headers: <String,String>{
            'Content-Type':'application/json'
          }
      );
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        return data ?? "No Output";
      }else{
        final data = jsonDecode(response.body);
        throw Exception('Error : ${data ?? 'Failed to run code'}');
      }
    }catch(e){
      print(e);
      throw Exception('Something went wrong :$e');
    }
  }
}