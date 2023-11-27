import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sdirbinsen/constants.dart';

class ModalPersonil {
  ModalPersonil._privateConstructor();
  static final ModalPersonil instance = ModalPersonil._privateConstructor();

  void addPersonil(BuildContext context, {Function? callback}) async {
    final TextEditingController nrpController = TextEditingController();
    final TextEditingController namaLengkapController = TextEditingController();
    final TextEditingController posisiController = TextEditingController();
    final TextEditingController rankController = TextEditingController();
    final TextEditingController batalyonController = TextEditingController();
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController staratController = TextEditingController();

    GlobalKey<FormState> addFormKey = GlobalKey<FormState>();

    Map<String, dynamic> onAddItem(context) {
      Map<String, dynamic> dataBatch = {
        'nrp': nrpController.text,
        'name': namaLengkapController.text,
        'position': posisiController.text,
        'rank': rankController.text,
        'battalion_name': batalyonController.text,
        'username': usernameController.text,
        'password': passwordController.text,
        'start_at': staratController.text
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
            'Tambah Personil',
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
                      Text("NRP", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                      SizedBox(height: 10.0),
                      TextFormField(
                          controller: nrpController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("NRP Tidak boleh kosong");
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
                              borderSide: BorderSide(color: merahColor)
                          ),
                          hintText: 'Cnth : 202002050',
                          prefixIcon: Icon(Icons.person, color: merahColor,),
                        ),),
                      SizedBox(height: 10.0),
                      Text("Nama Lengkap", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
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
                              borderSide: BorderSide(color: merahColor)
                          ),
                          hintText: 'Cnth : Jhon Smith',
                          prefixIcon: Icon(Icons.person, color: merahColor,),
                        ),),
                      SizedBox(height: 10.0),
                      Text("Posisi", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: posisiController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Posisi Tidak boleh kosong");
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
                              borderSide: BorderSide(color: merahColor)
                          ),
                          hintText: 'Cnth : Manager',
                          prefixIcon: Icon(Icons.person, color: merahColor,),
                        ),),
                      SizedBox(height: 10.0),
                      Text("Pangkat", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: rankController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Pangkat Tidak boleh kosong");
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
                              borderSide: BorderSide(color: merahColor)
                          ),
                          hintText: 'Cnth : Jendral',
                          prefixIcon: Icon(Icons.person, color: merahColor,),
                        ),),
                      SizedBox(height: 10.0),
                      Text("Batalyon", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                      SizedBox(height: 10.0),
                      TextFormField(
                          controller: batalyonController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Batalyon Tidak boleh kosong");
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
                              borderSide: BorderSide(color: merahColor)
                          ),
                          hintText: 'Cnth : Youn 1',
                          prefixIcon: Icon(Icons.person, color: merahColor,),
                        ),),
                      SizedBox(height: 10.0),
                      Text("Username", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
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
                              borderSide: BorderSide(color: merahColor)
                          ),
                          hintText: 'Cnth : Jhon Smith',
                          prefixIcon: Icon(Icons.person, color: merahColor,),
                        ),), SizedBox(height: 10.0),
                      Text("Password", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
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
                              borderSide: BorderSide(color: merahColor)
                          ),
                          hintText: 'Cnth : Jhon Smith 123',
                          prefixIcon: Icon(Icons.person, color: merahColor,),
                        ),),
                      SizedBox(height: 10.0),
                      Text("Tanggal", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: staratController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Tanggal Tidak boleh kosong");
                          }
                          return null;
                        },
                        keyboardType: TextInputType.datetime,
                        cursorColor: Color(0xFF000000),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: bgColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: merahColor)
                          ),
                          hintText: 'Cnth : 2023-05-13',
                          prefixIcon: Icon(Icons.person, color: merahColor,),
                        ),),
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

  void editPersonil(BuildContext context, {item, Function? callback}) async {

    final TextEditingController nrpController = TextEditingController(text: item['nrp']);
    final TextEditingController namaLengkapController = TextEditingController(text: item['name']);
    final TextEditingController posisiController = TextEditingController(text: item['position']);
    final TextEditingController rankController = TextEditingController(text: item['rank']);
    final TextEditingController batalyonController = TextEditingController(text: item['battalion_name']);
    final TextEditingController usernameController = TextEditingController(text: item['username']);
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController staratController = TextEditingController(text: item['start_at']);

    GlobalKey<FormState> addFormKey = GlobalKey<FormState>();

    Map<String, dynamic> onEditItem(context) {
      Map<String, dynamic> dataBatch = {
        'nrp': nrpController.text,
        'name': namaLengkapController.text,
        'position': posisiController.text,
        'rank': rankController.text,
        'battalion_name': batalyonController.text,
        'username': usernameController.text,
        'password': passwordController.text,
        'start_at': staratController.text
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
            'Ubah Personil',
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
                      Text("NRP", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                      SizedBox(height: 10.0),
                      TextFormField(
                        readOnly: true,
                        controller: nrpController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("NRP Tidak boleh kosong");
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
                              borderSide: BorderSide(color: merahColor)
                          ),
                          hintText: 'Cnth : 202002050',
                          prefixIcon: Icon(Icons.person, color: merahColor,),
                        ),),
                      SizedBox(height: 10.0),
                      Text("Nama Lengkap", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
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
                              borderSide: BorderSide(color: merahColor)
                          ),
                          hintText: 'Cnth : Jhon Smith',
                          prefixIcon: Icon(Icons.person, color: merahColor,),
                        ),),
                      SizedBox(height: 10.0),
                      Text("Posisi", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: posisiController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Posisi Tidak boleh kosong");
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
                              borderSide: BorderSide(color: merahColor)
                          ),
                          hintText: 'Cnth : Manager',
                          prefixIcon: Icon(Icons.person, color: merahColor,),
                        ),),
                      SizedBox(height: 10.0),
                      Text("Pangkat", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: rankController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Pangkat Tidak boleh kosong");
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
                              borderSide: BorderSide(color: merahColor)
                          ),
                          hintText: 'Cnth : Jendral',
                          prefixIcon: Icon(Icons.person, color: merahColor,),
                        ),),
                      SizedBox(height: 10.0),
                      Text("Batalyon", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: batalyonController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Batalyon Tidak boleh kosong");
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
                              borderSide: BorderSide(color: merahColor)
                          ),
                          hintText: 'Cnth : Youn 1',
                          prefixIcon: Icon(Icons.person, color: merahColor,),
                        ),),
                      SizedBox(height: 10.0),
                      Text("Username", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
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
                              borderSide: BorderSide(color: merahColor)
                          ),
                          hintText: 'Cnth : Jhon Smith',
                          prefixIcon: Icon(Icons.person, color: merahColor,),
                        ),), SizedBox(height: 10.0),
                      Text("Password", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
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
                              borderSide: BorderSide(color: merahColor)
                          ),
                          hintText: 'Cnth : Jhon Smith 123',
                          prefixIcon: Icon(Icons.person, color: merahColor,),
                        ),),
                      SizedBox(height: 10.0),
                      Text("Tanggal", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: staratController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Tanggal Tidak boleh kosong");
                          }
                          return null;
                        },
                        keyboardType: TextInputType.datetime,
                        cursorColor: Color(0xFF000000),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: bgColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: merahColor)
                          ),
                          hintText: 'Cnth : 2023-05-13',
                          prefixIcon: Icon(Icons.person, color: merahColor,),
                        ),),
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
                              Map<String, dynamic> data = onEditItem(context);
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
}
