import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sdirbinsen/constants.dart';

class ModalMaterial {
  ModalMaterial._privateConstructor();
  static final ModalMaterial instance = ModalMaterial._privateConstructor();

  void addMaterial(BuildContext context, {Function? callback}) async {

    final TextEditingController judulController = TextEditingController();
    final TextEditingController kategoriController = TextEditingController();
    final TextEditingController fileController = TextEditingController();
    final TextEditingController deskripsiController = TextEditingController();

    GlobalKey<FormState> addFormKey = GlobalKey<FormState>();

    Map<String, dynamic> onAddItem(context) {
      Map<String, dynamic> dataBatch = {
        'title': judulController.text,
        'category': kategoriController.text,
        'file': fileController.text,
        'description': deskripsiController.text,
      };

      return dataBatch;
    }

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(20.0),// <-- SEE HERE
          title: const Text('Tambah Material',
            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),),
          content: SingleChildScrollView(
            child: Form(
              key: addFormKey,
              child: Container(
                width: 700,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 16.0),
                    TextFormField(
                        controller: judulController,
                        autovalidateMode: AutovalidateMode
                            .onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Judul Tidak boleh kosong");
                          }
                          return null;
                        },
                        keyboardType:
                        TextInputType.text,
                        cursorColor: Color(0xFF000000),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: merahColor),
                          ),
                          focusColor: Colors.grey,
                          prefixIcon: Icon(
                            Icons.person,
                            color: merahColor,
                          ),
                          prefixStyle: TextStyle(
                              decorationColor: Colors.grey,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'PoppinLight'),
                          labelText: "Judul",
                          hintText:
                          "Binman",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w200),
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          contentPadding: EdgeInsets.fromLTRB(
                              20, 15, 20, 15),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(10),
                          ),
                        )),
                    SizedBox(height: 10.0),
                    TextFormField(
                        controller: kategoriController,
                        autovalidateMode: AutovalidateMode
                            .onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Kategori Tidak boleh kosong");
                          }
                          return null;
                        },
                        keyboardType:
                        TextInputType.text,
                        cursorColor: Color(0xFF000000),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: merahColor),
                          ),
                          focusColor: Colors.grey,
                          prefixIcon: Icon(
                            Icons.person,
                            color: merahColor,
                          ),
                          prefixStyle: TextStyle(
                              decorationColor: Colors.grey,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'PoppinLight'),
                          labelText: "Kategori",
                          hintText:
                          "Pangkat",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w200),
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          contentPadding: EdgeInsets.fromLTRB(
                              20, 15, 20, 15),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(10),
                          ),
                        )),
                    SizedBox(height: 10.0),
                    TextFormField(
                        controller: fileController,
                        autovalidateMode: AutovalidateMode
                            .onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("File Tidak boleh kosong");
                          }
                          return null;
                        },
                        keyboardType:
                        TextInputType.text,
                        cursorColor: Color(0xFF000000),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: merahColor),
                          ),
                          focusColor: Colors.grey,
                          prefixIcon: Icon(
                            Icons.person,
                            color: merahColor,
                          ),
                          prefixStyle: TextStyle(
                              decorationColor: Colors.grey,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'PoppinLight'),
                          labelText: "File",
                          hintText:
                          "https://google.com",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w200),
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          contentPadding: EdgeInsets.fromLTRB(
                              20, 15, 20, 15),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(10),
                          ),
                        )),
                    SizedBox(height: 10.0),
                    TextFormField(
                        controller: deskripsiController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        autovalidateMode: AutovalidateMode
                            .onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Deskripsi Tidak boleh kosong");
                          }
                          return null;
                        },
                        cursorColor: Color(0xFF000000),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: merahColor),
                          ),
                          focusColor: Colors.grey,
                          prefixIcon: Icon(
                            Icons.person,
                            color: merahColor,
                          ),
                          prefixStyle: TextStyle(
                              decorationColor: Colors.grey,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'PoppinLight'),
                          labelText: "Deskripsi",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w200),
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          contentPadding: EdgeInsets.fromLTRB(
                              20, 15, 20, 15),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(10),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_circle_left, color: Colors.black,),
                  label: Text("Kembali", style: TextStyle(
                      color: Colors.black
                  ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: merahColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: (){
                    if (addFormKey.currentState!.validate()) {
                      print("oke");
                      Map<String, dynamic> data = onAddItem(context);
                      callback!(data);
                      Navigator.of(context).pop();
                      Get.snackbar("Berhasil", "Data ini telah di tambahkan");
                    } else {
                      print("gagal");
                      Get.snackbar("Kesalahan", "Semua form harus diisi !");
                    }
                  },
                  icon: Icon(Icons.save, color: Colors.white,),
                  label: Text("Tambah", style: TextStyle(
                      color: Colors.white
                  ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void editMaterial(BuildContext context, {item, Function? callback}) async {
    final TextEditingController judulController = TextEditingController(text: item['title']);
    final TextEditingController kategoriController = TextEditingController(text: item['category']);
    final TextEditingController fileController = TextEditingController(text: item['file']);
    final TextEditingController deskripsiController = TextEditingController(text: item['description']);

    GlobalKey<FormState> addFormKey = GlobalKey<FormState>();

    Map<String, dynamic> onEditItem(context) {
      Map<String, dynamic> dataBatch = {
        'title': judulController.text,
        'category': kategoriController.text,
        'file': fileController.text,
        'description': deskripsiController.text,
        'created_at': '',
      };

      return dataBatch;
    }

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(20.0),// <-- SEE HERE
          title: const Text('Edit Material',
            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),),
          content: SingleChildScrollView(
            child: Form(
              key: addFormKey,
              child: Container(
                width: 700,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 16.0),
                    TextFormField(
                        controller: judulController,
                        autovalidateMode: AutovalidateMode
                            .onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Judul Tidak boleh kosong");
                          }
                          return null;
                        },
                        keyboardType:
                        TextInputType.text,
                        cursorColor: Color(0xFF000000),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: merahColor),
                          ),
                          focusColor: Colors.grey,
                          prefixIcon: Icon(
                            Icons.person,
                            color: merahColor,
                          ),
                          prefixStyle: TextStyle(
                              decorationColor: Colors.grey,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'PoppinLight'),
                          labelText: "Judul",
                          hintText:
                          "Binman",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w200),
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          contentPadding: EdgeInsets.fromLTRB(
                              20, 15, 20, 15),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(10),
                          ),
                        )),
                    SizedBox(height: 10.0),
                    TextFormField(
                        controller: kategoriController,
                        autovalidateMode: AutovalidateMode
                            .onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Kategori Tidak boleh kosong");
                          }
                          return null;
                        },
                        keyboardType:
                        TextInputType.text,
                        cursorColor: Color(0xFF000000),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: merahColor),
                          ),
                          focusColor: Colors.grey,
                          prefixIcon: Icon(
                            Icons.person,
                            color: merahColor,
                          ),
                          prefixStyle: TextStyle(
                              decorationColor: Colors.grey,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'PoppinLight'),
                          labelText: "Kategori",
                          hintText:
                          "Pangkat",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w200),
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          contentPadding: EdgeInsets.fromLTRB(
                              20, 15, 20, 15),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(10),
                          ),
                        )),
                    SizedBox(height: 10.0),
                    TextFormField(
                        controller: fileController,
                        autovalidateMode: AutovalidateMode
                            .onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("File Tidak boleh kosong");
                          }
                          return null;
                        },
                        keyboardType:
                        TextInputType.text,
                        cursorColor: Color(0xFF000000),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: merahColor),
                          ),
                          focusColor: Colors.grey,
                          prefixIcon: Icon(
                            Icons.person,
                            color: merahColor,
                          ),
                          prefixStyle: TextStyle(
                              decorationColor: Colors.grey,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'PoppinLight'),
                          labelText: "File",
                          hintText:
                          "Ucup Gacor",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w200),
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          contentPadding: EdgeInsets.fromLTRB(
                              20, 15, 20, 15),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(10),
                          ),
                        )),
                    SizedBox(height: 10.0),
                    TextFormField(
                        controller: deskripsiController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        autovalidateMode: AutovalidateMode
                            .onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Deskripsi Tidak boleh kosong");
                          }
                          return null;
                        },
                        cursorColor: Color(0xFF000000),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: merahColor),
                          ),
                          focusColor: Colors.grey,
                          prefixIcon: Icon(
                            Icons.person,
                            color: merahColor,
                          ),
                          prefixStyle: TextStyle(
                              decorationColor: Colors.grey,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'PoppinLight'),
                          labelText: "Deskripsi",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w200),
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          contentPadding: EdgeInsets.fromLTRB(
                              20, 15, 20, 15),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(10),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_circle_left, color: Colors.black,),
                  label: Text("Kembali", style: TextStyle(
                      color: Colors.black
                  ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: merahColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: (){
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
                  icon: Icon(Icons.save, color: Colors.white,),
                  label: Text("Save", style: TextStyle(
                      color: Colors.white
                  ),
                  ),
                ),
              ],
            ),
          ],
        );

      },
    );
  }


  void tmbhMaterial(BuildContext context, {Function? callback}) async {
    final TextEditingController judulController = TextEditingController();
    final TextEditingController kategoriController = TextEditingController();
    final TextEditingController fileController = TextEditingController();
    final TextEditingController deskripsiController = TextEditingController();

    Map<String, dynamic> onAddItem(context) {
      Map<String, dynamic> dataBatch = {
        'title': judulController.text,
        'category': kategoriController.text,
        'file': fileController.text,
        'description': deskripsiController.text,
      };

      return dataBatch;
    }

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(20.0),// <-- SEE HERE
          title: const Text('Tambah Material',
            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),),
          content: SingleChildScrollView(
            child: Container(
              width: 700,
              height: 450,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 16.0),
                  TextFormField(
                      controller: judulController,
                      autovalidateMode: AutovalidateMode
                          .onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Judul Tidak boleh kosong");
                        }
                        return null;
                      },
                      keyboardType:
                      TextInputType.text,
                      cursorColor: Color(0xFF000000),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: merahColor),
                        ),
                        focusColor: Colors.grey,
                        prefixIcon: Icon(
                          Icons.person,
                          color: merahColor,
                        ),
                        prefixStyle: TextStyle(
                            decorationColor: Colors.grey,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'PoppinLight'),
                        labelText: "Judul",
                        hintText:
                        "Binman",
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w200),
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.fromLTRB(
                            20, 15, 20, 15),
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10),
                        ),
                      )),
                  SizedBox(height: 10.0),
                  TextFormField(
                      controller: kategoriController,
                      autovalidateMode: AutovalidateMode
                          .onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Kategori Tidak boleh kosong");
                        }
                        return null;
                      },
                      keyboardType:
                      TextInputType.text,
                      cursorColor: Color(0xFF000000),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: merahColor),
                        ),
                        focusColor: Colors.grey,
                        prefixIcon: Icon(
                          Icons.person,
                          color: merahColor,
                        ),
                        prefixStyle: TextStyle(
                            decorationColor: Colors.grey,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'PoppinLight'),
                        labelText: "Kategori",
                        hintText:
                        "Pangkat",
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w200),
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.fromLTRB(
                            20, 15, 20, 15),
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10),
                        ),
                      )),
                  SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: bgColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                      controller: fileController,
                      autovalidateMode: AutovalidateMode
                          .onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("File Tidak boleh kosong");
                        }
                        return null;
                      },
                      keyboardType:
                      TextInputType.text,
                      cursorColor: Color(0xFF000000),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: merahColor),
                        ),
                        focusColor: Colors.grey,
                        prefixIcon: Icon(
                          Icons.person,
                          color: merahColor,
                        ),
                        prefixStyle: TextStyle(
                            decorationColor: Colors.grey,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'PoppinLight'),
                        labelText: "File",
                        hintText:
                        "Ucup Gacor",
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w200),
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.fromLTRB(
                            20, 15, 20, 15),
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10),
                        ),
                      )),
                  SizedBox(height: 10.0),
                  TextFormField(
                      controller: deskripsiController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      autovalidateMode: AutovalidateMode
                          .onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Deskripsi Tidak boleh kosong");
                        }
                        return null;
                      },
                      cursorColor: Color(0xFF000000),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: merahColor),
                        ),
                        focusColor: Colors.grey,
                        prefixIcon: Icon(
                          Icons.person,
                          color: merahColor,
                        ),
                        prefixStyle: TextStyle(
                            decorationColor: Colors.grey,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'PoppinLight'),
                        labelText: "Deskripsi",
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w200),
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.fromLTRB(
                            20, 15, 20, 15),
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10),
                        ),
                      )),
                ],
              ),
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_circle_left, color: Colors.black,),
                  label: Text("Kembali", style: TextStyle(
                      color: Colors.black
                  ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: merahColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: (){
                    onAddItem(context);
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.save, color: Colors.white,),
                  label: Text("Tambah", style: TextStyle(
                      color: Colors.white
                  ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
