import 'dart:convert';

import 'package:http/http.dart' as http;

import '../global_variable.dart';

class CppCodeController{
  Future<Map<String,dynamic>> runCode(String code,String input)async{
    try{
      http.Response response = await http.post(
          Uri.parse('$uri/api/run-cpp'),
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