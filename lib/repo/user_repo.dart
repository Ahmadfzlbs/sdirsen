import 'dart:convert';

import 'package:sdirbinsen/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserRepo {
  UserRepo._privateContructor();
  static final UserRepo instance = UserRepo._privateContructor();

  Future user() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.get('token');
    try {
      final response = await http.get(
        Uri.parse(Api.user),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "bearer $value",
        },
      );
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        Iterable iterable = json['list_data']['user']['data'];
        print(json);
        return iterable;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future addUser(Map<String, dynamic> body) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.get('token');
    try {
      final response = await http.post(Uri.parse(Api.user),
          headers: <String, String>{
            'Authorization': "bearer $value",
          },
          body: body);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future editUser(dynamic id, Map<String, dynamic> body) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.get('token');
    try {
      final response = await http.post(Uri.parse('${Api.user}/$id'),
          headers: <String, String>{
            'Authorization': "bearer $value",
          },
          body: body);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        print(json);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future deleteUser(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.get('token');

    try {
      final response = await http.delete(Uri.parse('${Api.user}/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "bearer $value",
        },
      );
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        print(json);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }


}
