import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:collection/collection.dart';
import 'package:sdirbinsen/personil/component/widget/modal_personil.dart';
import 'package:sdirbinsen/repo/personil_repo.dart';

import '../../constants.dart';
import '../../responsive.dart';

class BodyPersonil extends StatelessWidget {
  const BodyPersonil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isMobile(context)) Expanded(child: BodyFieldPersonil()),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: BodyFieldPersonil()),
      ],
    );
  }
}

class BodyFieldPersonil extends StatefulWidget {
  const BodyFieldPersonil({Key? key}) : super(key: key);

  @override
  BodyFieldPersonilC createState() => BodyFieldPersonilC();
}

class BodyFieldPersonilC extends State<BodyFieldPersonil> {
  // The following list is already sorted by id
  List _dataPersonil = [];

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
    personil();
    _selected = List<bool>.generate(_dataPersonil.length, (int index) => false);
  }

  void personil() async {
    await PersonilRepo.instance.personil().then((value) {
      setState(() {
        _dataPersonil = value as List;
      });
    });
  }

  void addPersonil() {
    ModalPersonil.instance.addPersonil(context, callback: (res) async {
      await PersonilRepo.instance.addPersonil(res).then((value) {
        personil();
      });
    });
  }

  void editPersonil(item) {
    ModalPersonil.instance.editPersonil(context, item: item, callback: (res) async {
      await PersonilRepo.instance
          .editPersonil(item['id'], res)
          .then((value) {
        personil();
      });
    });
  }

  void deletePersonil(int id) async {
    await PersonilRepo.instance.deletePersonil(id).then((value) {
      personil();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Personil",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
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
              onPressed: () {},
              icon: Icon(Icons.download,
                  color: merahColor), //icon data for elevated button
              label: Text("Unduh",
                  style: TextStyle(color: merahColor)), //label text
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
                setState(() {
                  addPersonil();
                  personil();
                });
              },
              icon: Icon(Icons.add,
                  color: Colors.white), //icon data for elevated button
              label: Text("Tambah", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        SizedBox(height: 15),
        Column(
          children: [
            Container(
              width: double.infinity,
              height: _dataPersonil.length * 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                final isSelected =
                                    selectedItems.contains(item);
                                return InkWell(
                                  onTap: () {
                                    isSelected
                                        ? selectedItems.remove(item)
                                        : selectedItems.add(item);
                                    //This rebuilds the StatefulWidget to update the button's text
                                    setState(() {});
                                    //This rebuilds the dropdownMenu Widget to update the check mark
                                    menuSetState(() {});
                                  },
                                  child: Container(
                                    color: Colors.white,
                                    height: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
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
                                          const Icon(
                                            Icons.radio_button_checked,
                                            color: merahColor,
                                          )
                                        else
                                          const Icon(Icons
                                              .radio_button_unchecked_outlined),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }).toList(),
                        //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                        value: selectedItems.isEmpty
                            ? null
                            : selectedItems.last,
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
      DataColumn(label: Text('NRP', overflow: TextOverflow.ellipsis)),
      DataColumn(label: Text('Nama Lengkap', overflow: TextOverflow.ellipsis)),
      DataColumn(label: Text('Jabatan', overflow: TextOverflow.ellipsis)),
      DataColumn(label: Text('Pangkat', overflow: TextOverflow.ellipsis)),
      DataColumn(label: Text('Nama Batalyon', overflow: TextOverflow.ellipsis)),
      DataColumn(label: Text('Tanggal Masuk', overflow: TextOverflow.ellipsis)),
      DataColumn(label: Text('Opsi', overflow: TextOverflow.ellipsis))
    ];
  }

  List<DataRow> _createRows() {
    return _dataPersonil.length > 0
        ? _dataPersonil
            .mapIndexed((index, item) => DataRow(
                  cells: [
                    DataCell(Text(item['nrp'] ?? '', overflow: TextOverflow.ellipsis, maxLines: 3, )),
                    DataCell(Text(item['name'] ?? '', overflow: TextOverflow.ellipsis, maxLines: 3,)),
                    DataCell(Text(item['position'] ?? '', overflow: TextOverflow.ellipsis, maxLines: 3,)),
                    DataCell(Text(item['rank'] ?? '', overflow: TextOverflow.ellipsis, maxLines: 3,)),
                    DataCell(Text(item['battalion_name'] ?? '', overflow: TextOverflow.ellipsis, maxLines: 3,)),
                    DataCell(Text(item['start_at'] ?? '', overflow: TextOverflow.ellipsis, maxLines: 3,)),
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
                            editPersonil(item);
                          } else if (value == 1) {

                          } else if (value == 2) {
                            print("Logout menu is selected.");
                          } else if (value == 3) {
                            deletePersonil(item['id']);
                            Get.snackbar("Berhasil", "Data ini telah di hapus");
                          }
                        },
                      ),
                    ),
                  ],
                ))
            .toList()
        : [];
  }
}
