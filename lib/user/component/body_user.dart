import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:sdirbinsen/user/component/widget/modal_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../repo/user_repo.dart';
import '../../responsive.dart';
import '../../utils/api.dart';

class BodyUser extends StatelessWidget {
  const BodyUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isMobile(context)) Expanded(child: BodyFieldUser()),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: BodyFieldUser()),
      ],
    );
  }
}

class BodyFieldUser extends StatefulWidget {
  const BodyFieldUser({Key? key}) : super(key: key);

  @override
  BodyFieldUserC createState() => BodyFieldUserC();
}
class BodyFieldUserC extends State<BodyFieldUser> {
  // The following list is already sorted by id
  List _dataUser = [];

  final List<String> items = [
    'Default',
    'First Name',
    'Last Name',
    'Due Date',
    'Last Login',
  ];

  List<String> selectedItems = [];

  List<bool> _selected = [];

  @override
  void initState() {
    super.initState();
    user();
    _selected = List<bool>.generate(_dataUser.length, (int index) => false);
  }

  void user() async {
    await UserRepo.instance.user().then((value) {
      setState(() {
        _dataUser = value as List;
      });
    });
  }

  void addUser() {
    ModalUser.instance.addUser(context, callback: (res) async {
      await UserRepo.instance.addUser(res).then((value) {
        user();
      });
    });
  }

  void editUser(item) {
    ModalUser.instance.editUser(context, item: item, callback: (res) async {
      await UserRepo.instance
          .editUser(item['id'], res)
          .then((value) {
        user();
      });
    });
  }

  void deleteUser(int id) async {
    await UserRepo.instance.deleteUser(id).then((value) {
      user();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Manajemen User",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: bgColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: (){
                print("You pressed Icon Elevated Button");
              },
              icon: Icon(Icons.download, color: merahColor),  //icon data for elevated button
              label: Text("Unduh", style: TextStyle(color: merahColor)), //label text
            ),
            SizedBox(width: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: merahColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                addUser();
              },
              icon: Icon(Icons.add, color: Colors.white),  //icon data for elevated button
              label: Text("Tambah", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        SizedBox(height: 15),
        Column(
          children: [
            Container(
              width: double.infinity,
              height: _dataUser.length * 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              'Filter',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: items.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                //disable default onTap to avoid closing menu when selecting an item
                                enabled: false,
                                child: StatefulBuilder(
                                  builder: (context, menuSetState) {
                                    final isSelected = selectedItems.contains(item);
                                    return InkWell(
                                      onTap: () {
                                        isSelected ? selectedItems.remove(item) : selectedItems.add(item);
                                        //This rebuilds the StatefulWidget to update the button's text
                                        setState(() {});
                                        //This rebuilds the dropdownMenu Widget to update the check mark
                                        menuSetState(() {});
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        height: double.infinity,
                                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            if (isSelected)
                                              const Icon(Icons.radio_button_checked, color: merahColor,)
                                            else
                                              const Icon(Icons.radio_button_unchecked_outlined),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }).toList(),
                            //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                            value: selectedItems.isEmpty ? null : selectedItems.last,
                            onChanged: (value) {},
                            selectedItemBuilder: (context) {
                              return items.map(
                                    (item) {
                                  return Container(
                                    alignment: AlignmentDirectional.center,
                                    child: Text(
                                      selectedItems.join(', '),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 1,
                                    ),
                                  );
                                },
                              ).toList();
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.only(left: 16, right: 8),
                              height: 40,
                              width: 150,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ],
                    ),
                    _createDataTable(),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Container _createDataTable() {
    return Container(
      width: double.infinity,
      child: DataTable(columns: _createColumns(), rows: _createRows()),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('Nama', overflow: TextOverflow.ellipsis,)),
      DataColumn(label: Text('Username', overflow: TextOverflow.ellipsis,)),
      DataColumn(label: Text('Opsi', overflow: TextOverflow.ellipsis,)),
    ];
  }

  List<DataRow> _createRows() {
    return _dataUser.length > 0
        ? _dataUser
        .mapIndexed((index, item) => DataRow(cells: [
      DataCell(Container(child: Text(item['name'] ?? ''))),
      DataCell(Container(child: Text(item['username'] ?? ''))),
      DataCell(
        PopupMenuButton<int>(
          itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
            const PopupMenuItem<int>(
              value: 0,
              child: Row(
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Edit",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            PopupMenuItem<int>(
              value: 1,
              child: Row(
                children: [
                  Icon(
                    Icons.remove_red_eye,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Text("View Profile",
                      style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            PopupMenuItem<int>(
              value: 2,
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.greenAccent,
                  ),
                  SizedBox(width: 10),
                  Text("Activate User",
                      style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
            PopupMenuItem<int>(
              value: 3,
              child: Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10),
                  Text("Delete",
                      style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            if (value == 0) {
              editUser(item);
            } else if (value == 1) {

            } else if (value == 2) {
              print("Logout menu is selected.");
            } else if (value == 3) {
              deleteUser(item['id']);
              Get.snackbar("Berhasil", "Data ini telah di hapus");
            }
          },
        ),
      ),
    ],))
        .toList()
        : [];
  }
}