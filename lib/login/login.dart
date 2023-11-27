import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sdirbinsen/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sdirbinsen/sidebar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/api.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController usernameC = TextEditingController();
TextEditingController passwordC = TextEditingController();

GlobalKey<FormState> addFormKey = GlobalKey<FormState>();

Future<LoginUseCase> login(String username, String password) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  try {
    final response = await http.post(Uri.parse(Api.login),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password
      }),
    );
    if (response.statusCode == 200) {
      LoginUseCase loginUseCase = LoginUseCase.fromJson(jsonDecode(response.body));
      await prefs.setString('token', loginUseCase.listData.token);
      await prefs.setString('role', loginUseCase.listData.role);

      return loginUseCase;
    } else {
      throw Exception(response.statusCode);
    }
  } catch (e) {
    throw Exception(e);
  }
}

class LoginUseCase {
  LoginUseCase({
    required this.message,
    required this.status,
    required this.listData,
  });
  late final String message;
  late final String status;
  late final ListData listData;

  LoginUseCase.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    listData = ListData.fromJson(json['list_data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['list_data'] = listData.toJson();
    return _data;
  }
}

class ListData {
  ListData({
    required this.user,
    required this.token,
    required this.role,
  });
  late final User user;
  late final String token;
  late final String role;

  ListData.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['user']);
    token = json['token'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    _data['token'] = token;
    _data['role'] = role;
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.roleId,
    required this.username,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String roleId;
  late final String username;
  late final String createdAt;
  late final String updatedAt;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    roleId = json['role_id'];
    username = json['username'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['role_id'] = roleId;
    _data['username'] = username;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

Future<void> submit() async {
  try {
    final loginResult = await login(
      usernameC.text,
      passwordC.text,
    );
    if (loginResult.listData != null) {
      Get.to(SidebarMenu());
    } else {
      Get.closeAllSnackbars();
      Get.snackbar("Kesalahan", "Gagal masuk, silangkan hubungi admin !!");
    }
  } catch (e) {
    Get.closeAllSnackbars();
    Get.snackbar("Kesalahan", "$e");
  }
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Container(
          height: 450,
          width: 500,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: addFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text("Username", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                        SizedBox(height: 8),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Username tidak boleh kosong";
                            } else {
                              return null;
                            }
                          },
                          cursorColor: Colors.black,
                          controller: usernameC,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: bgColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: merahColor)
                            ),
                            hintText: 'Masukan username anda',
                            prefixIcon: Icon(Icons.person, color: merahColor,),
                          ),
                        ),
                        SizedBox(height: 14),
                        Text("Password", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                        SizedBox(height: 8),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Password tidak boleh kosong";
                            } else {
                              return null;
                            }
                          },
                          obscureText: true,
                          cursorColor: Colors.black,
                          controller: passwordC,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: bgColor,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: merahColor)
                            ),
                            hintText: 'Masukan password anda',
                            prefixIcon: Icon(Icons.lock, color: merahColor,),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 35,
                      width: double.infinity,
                      child: ElevatedButton(onPressed: (){
                        if (addFormKey.currentState!.validate()) {
                          // Perform add book operation
                          submit();
                        } else {
                          Get.snackbar("Kesalahan", "Semua form harus diisi !!");
                        }
                      }, child: Text("Login", style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        primary: merahColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15)
                      ),),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}