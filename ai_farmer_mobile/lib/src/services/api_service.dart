import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://kisan-copilot-backend.onrender.com";

  static Future<Map<String, dynamic>> runDemo(File image) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/demo'),
    );

    request.files.add(
      await http.MultipartFile.fromPath('file', image.path),
    );

    final response = await request.send();
    final body = await response.stream.bytesToString();

    return json.decode(body);
  }
}
