import 'dart:convert';

import 'package:code_editor/global_variable.dart';
import 'package:http/http.dart' as http;
class PythonCodeController {

  Future<Map<String, dynamic>> runCode(String code, String input) async {
    try {
      final response = await http.post(
        Uri.parse('$uri/api/run-code'),
        body: jsonEncode({'code': code, 'input': input}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data ?? 'No output';
      } else {
        final data = jsonDecode(response.body);
        throw Exception('Error: ${data ?? 'Failed to run code'}');
      }
    } catch (e) {
      throw Exception('Something went wrong: $e');
    }
  }







}