import 'dart:convert';

import 'package:sdirbinsen/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PersonilRepo {
  PersonilRepo._privateContructor();
  static final PersonilRepo instance = PersonilRepo._privateContructor();

  Future personil() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.get('token');
    try {
      final response = await http.get(
        Uri.parse(Api.personil),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "bearer $value",
        },
      );
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        Iterable iterable = json['list_data']['personil']['data'];
        return iterable;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future addPersonil(Map<String, dynamic> body) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.get('token');
    try {
      final response = await http.post(Uri.parse(Api.personil),
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

  Future editPersonil(dynamic id, Map<String, dynamic> body) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.get('token');
    try {
      final response = await http.post(Uri.parse('${Api.personil}/$id'),
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

  Future deletePersonil(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.get('token');

    try {
      final response = await http.delete(Uri.parse('${Api.personil}/$id'),
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
