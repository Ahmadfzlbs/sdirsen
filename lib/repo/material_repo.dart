import 'dart:convert';
import 'dart:html';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdirbinsen/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MaterialRepo {
  MaterialRepo._privateContructor();

  static final MaterialRepo instance = MaterialRepo._privateContructor();

  Future material() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.get('token');
    try {
      final response = await http.get(
        Uri.parse(Api.material),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "bearer $value",
        },
      );
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        Iterable iterable = json['list_data']['material']['data'];
        return iterable;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future addMaterial(Map<String, dynamic> body) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.get('token');
    try {
      final response = await http.post(Uri.parse(Api.material),
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

  Future editMaterial(dynamic id, Map<String, dynamic> body) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.get('token');
    try {
      final response = await http.post(Uri.parse('${Api.material}/$id'),
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

  Future deleteMaterial(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.get('token');

    try {
      final response = await http.delete(Uri.parse('${Api.material}/$id'),
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
