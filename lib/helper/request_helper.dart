import 'dart:convert';

import 'package:flutter_web_kitshop/constant_text.dart';
import 'package:http/http.dart' as http;

class RequstHelper {
  static Future<dynamic> signUpRequest({
    String name,
    String address,
    String email,
    String phone,
    String password,
  }) async {
    var url = 'https://$server/api/register';
    Map<String, dynamic> _body = {
      "name": name,
      "address": address,
      "branches": 1,
      "email": email,
      "phone": phone,
      "password": password,
    };

    http.Response response = await http.post(Uri.parse(url),
        headers: {
          "Access-Control-Allow-Headers": "Content-Type",
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods": "POST,GET,DELETE,PUT,OPTIONS",
          "Content-Type": "application/json",
          "ApiKey": serverApiKey
        },
        body: jsonEncode(_body));

    try {
      if (response.statusCode == 200) {
        String data = response.body;
        var decodeData = jsonDecode(data);
        print(decodeData);
        String _idRes = decodeData['id'];
        return _idRes;
      } else {
        print('failed');
        return 'failed';
      }
    } catch (e) {
      print('failed $e');
    }
  }
}
