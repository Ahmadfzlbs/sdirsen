import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:sdirbinsen/material/component/widget/modal_material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';
import '../../personil/component/widget/modal_personil.dart';
import '../../repo/material_repo.dart';
import '../../responsive.dart';
import '../../utils/api.dart';

class BodyMaterial extends StatelessWidget {
  const BodyMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isMobile(context)) Expanded(child: BodyFieldMaterial()),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: BodyFieldMaterial()),
      ],
    );
  }
}

class BodyFieldMaterial extends StatefulWidget {
  const BodyFieldMaterial({Key? key}) : super(key: key);

  @override
  BodyFieldMaterialC createState() => BodyFieldMaterialC();
}
class BodyFieldMaterialC extends State<BodyFieldMaterial> {
  // The following list is already sorted by id
  List _dataMaterial = [];

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
    material();
    _selected = List<bool>.generate(_dataMaterial.length, (int index) => false);
  }

  void material() async {
    await MaterialRepo.instance.material().then((value) {
      setState(() {
        _dataMaterial = value as List;
      });
    });
  }

  void addMaterial() {
    ModalMaterial.instance.addMaterial(context, callback: (res) async {
      await MaterialRepo.instance.addMaterial(res).then((value) {
        material();
      });
    });
  }

  void editMaterial(item) {
    ModalMaterial.instance.editMaterial(context, item: item, callback: (res) async {
      await MaterialRepo.instance
          .editMaterial(item['id'], res)
          .then((value) {
        material();
      });
    });
  }

  void deleteMaterial(int id) async {
    await MaterialRepo.instance.deleteMaterial(id).then((value) {
      material();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Material",
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
              onPressed: (){},
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
                addMaterial();
              },
              icon: Icon(Icons.add, color: Colors.white),  //icon data for elevated button
              label: Text("Tambah", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        SizedBox(height: 15),
        Container(
          width: double.infinity,
          height: _dataMaterial.length * 90,
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
        ),
      ],
    );
  }

  Expanded _createDataTable() {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: DataTable(columns: _createColumns(), rows: _createRows()),
      ),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('Judul', overflow: TextOverflow.ellipsis,)),
      DataColumn(label: Text('Kategori', overflow: TextOverflow.ellipsis,)),
      DataColumn(label: Text('Deskripsi', overflow: TextOverflow.ellipsis,)),
      DataColumn(label: Text('Dibuat', overflow: TextOverflow.ellipsis,)),
      DataColumn(label: Text('Opsi', overflow: TextOverflow.ellipsis,)),
    ];
  }
  List<DataRow> _createRows() {
    return _dataMaterial.length > 0
        ? _dataMaterial
        .mapIndexed((index, item) => DataRow(cells: [
      DataCell(Container(child: Text(item['title'] ?? ''))),
      DataCell(Container(child: Text(item['category'] ?? ''))),
      DataCell(Container(child: Text(item['description'] ?? ''))),
      DataCell(Text(item['created_at'] ?? '')),
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
              editMaterial(item);
            } else if (value == 1) {

            } else if (value == 2) {
              print("Logout menu is selected.");
            } else if (value == 3) {
              deleteMaterial(item['id']);
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