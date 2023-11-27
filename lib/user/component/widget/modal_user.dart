import 'package:bs_flutter_selectbox/bs_flutter_selectbox.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sdirbinsen/constants.dart';

class ModalUser {
  ModalUser._privateConstructor();

  static final ModalUser instance = ModalUser._privateConstructor();

  void addUser(BuildContext context, {Function? callback}) async {
    BsSelectBoxController roleController = BsSelectBoxController(options: [
      BsSelectBoxOption(value: 'admin', text: Text('Admin')),
      BsSelectBoxOption(value: 'searcher', text: Text('Searcher')),
    ]);

    GlobalKey<FormState> addFormKey = GlobalKey<FormState>();

    final TextEditingController namaLengkapController = TextEditingController();
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    Map<String, dynamic> onAddItem(context) {
      Map<String, dynamic> dataBatch = {
        'role': roleController.getSelectedAsString(),
        'name': namaLengkapController.text,
        'username': usernameController.text,
        'password': passwordController.text,
      };

      return dataBatch;
    }

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(20.0), // <-- SEE HERE
          title: const Text(
            'Tambah User',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),
          ),
          content: Form(
            key: addFormKey,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 16.0),
                      Text(
                        "Role",
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10.0),
                      BsSelectBox(
                        hintText: 'Pilih salah satu',
                        controller: roleController,
                        dialogStyle: BsDialogBoxStyle(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        style: BsSelectBoxStyle(
                          border: Border.all(color: Colors.grey),
                          hintTextColor: Colors.grey,
                          selectedColor: Color(0xff3872d1),
                          selectedTextColor: Colors.black,
                          textColor: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                          focusedTextColor: Color(0xff3367bd),
                          // borderRadius: BorderRadius.circular(10.0),
                        ),
                        validators: [BsSelectValidators.required],
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Nama Lengkap",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: namaLengkapController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Nama Lengkap Tidak boleh kosong");
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        cursorColor: Color(0xFF000000),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: bgColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: merahColor)),
                          hintText: 'Cnth : Jhon Smith',
                          prefixIcon: Icon(
                            Icons.credit_card,
                            color: merahColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Username",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: usernameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Username Tidak boleh kosong");
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        cursorColor: Color(0xFF000000),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: bgColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: merahColor)),
                          hintText: 'Cnth : Jhon Smith',
                          prefixIcon: Icon(
                            Icons.person,
                            color: merahColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Password",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Password Tidak boleh kosong");
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        cursorColor: Color(0xFF000000),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: bgColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: merahColor)),
                          hintText: 'Cnth : Jhon Smith 123',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: merahColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        width: 720,
                        height: 40,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: merahColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            if (addFormKey.currentState!.validate()) {
                              print("oke");
                              // Perform add book operation
                              Map<String, dynamic> data = onAddItem(context);
                              callback!(data);
                              Navigator.of(context).pop();
                              Get.snackbar("Berhasil", "Data ini telah di tambahkan");
                            } else {
                              print("gagal");
                              Get.snackbar("Kesalahan", "Semua form harus diisi !");
                            }
                          },
                          icon: Icon(
                            Icons.save,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Tambah",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 18),
                      Container(
                        width: 720,
                        height: 40,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.black,
                          ),
                          label: Text(
                            "Kembali",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          actions: <Widget>[],
        );
      },
    );
  }

  void editUser(BuildContext context, {item, Function? callback}) async {
    final TextEditingController roleIdController =
        TextEditingController(text: item['role_id']);
    final TextEditingController namaLengkapController =
        TextEditingController(text: item['name']);
    final TextEditingController usernameController =
        TextEditingController(text: item['username']);
    final TextEditingController passwordController =
        TextEditingController(text: item['password']);
    final TextEditingController roleNameController =
        TextEditingController(text: item['role_name']);

    BsSelectBoxController roleController = BsSelectBoxController(options: [
      BsSelectBoxOption(value: item['role_name'], text: Text(item['role_name'])),
      BsSelectBoxOption(value: 'admin', text: Text('Admin')),
      BsSelectBoxOption(value: 'searcher', text: Text('Searcher')),
    ]);

    GlobalKey<FormState> addFormKey = GlobalKey<FormState>();

    Map<String, dynamic> onEditItem(context) {
      Map<String, dynamic> dataBatch = {
        'role': roleController.getSelectedAsString(),
        'name': namaLengkapController.text,
        'username': usernameController.text,
        'password': passwordController.text,
        'role_name': roleNameController.text,
      };

      return dataBatch;
    }

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(20.0), // <-- SEE HERE
          title: const Text(
            'Ubar User',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),
          ),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: addFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 16.0),
                      Text(
                        "Role",
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10.0),
                      BsSelectBox(
                        hintText: 'Pilih salah satu',
                        controller: roleController,
                        dialogStyle: BsDialogBoxStyle(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        style: BsSelectBoxStyle(
                          border: Border.all(color: Colors.grey),
                          hintTextColor: Colors.grey,
                          selectedColor: Color(0xff3872d1),
                          selectedTextColor: Colors.black,
                          textColor: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                          focusedTextColor: Color(0xff3367bd),
                          // borderRadius: BorderRadius.circular(10.0),
                        ),
                        validators: [BsSelectValidators.required],
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Nama Lengkap",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: namaLengkapController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Nama Lengkap Tidak boleh kosong");
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        cursorColor: Color(0xFF000000),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: bgColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: merahColor)),
                          hintText: 'Cnth : Jhon Smith',
                          prefixIcon: Icon(
                            Icons.person,
                            color: merahColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Username",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: usernameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Username Tidak boleh kosong");
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        cursorColor: Color(0xFF000000),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: bgColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: merahColor)),
                          hintText: 'Cnth : Jhon Smith',
                          prefixIcon: Icon(
                            Icons.person,
                            color: merahColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Password",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Password Tidak boleh kosong");
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        cursorColor: Color(0xFF000000),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: bgColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: merahColor)),
                          hintText: 'Cnth : Jhon Smith 123',
                          prefixIcon: Icon(
                            Icons.person,
                            color: merahColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        width: 720,
                        height: 40,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: merahColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            Map<String, dynamic> data = onEditItem(context);
                            callback!(data);
                            Navigator.of(context).pop();
                            Get.snackbar(
                                "Berhasil", "Data ini telah di tambahkan");
                          },
                          icon: Icon(
                            Icons.save,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Tambah",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 18),
                      Container(
                        width: 720,
                        height: 40,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.black,
                          ),
                          label: Text(
                            "Kembali",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          actions: <Widget>[],
        );
      },
    );
  }
}
