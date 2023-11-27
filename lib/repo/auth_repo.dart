import 'package:shared_preferences/shared_preferences.dart';
import 'package:sdirbinsen/utils/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRepo{
  AuthRepo._privateContructor();
  static final AuthRepo instance = AuthRepo._privateContructor();

  final _uriLogin = Api.login;

  Future login(Map<String, dynamic> body) async {
    try {
      final response = await http.post(Uri.parse(_uriLogin), body: body);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        Iterable iterable = jsonResponse['data'];

        //Set session
        setSession("user", iterable.first);
        return true;
      }
    } catch (e) {
      print(e);
    }
    print('error');
    return false;
  }

  Future<void> setSession(String key, Map<String, dynamic> value) async {
    final preference = await SharedPreferences.getInstance();
    if (preference.containsKey(key)) {
      preference.remove(key);
    }
    preference.setString(key, jsonEncode(value));
  }

  Future getSession(String key) async {
    final preference = await SharedPreferences.getInstance();
    if (preference.containsKey(key)) {
      final data = jsonDecode(preference.getString(key).toString());
      return data;
    } else {
      return null;
    }
  }
}