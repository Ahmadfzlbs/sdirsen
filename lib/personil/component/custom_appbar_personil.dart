import 'package:flutter/material.dart';
import 'package:sdirbinsen/personil/component/search_personil.dart';

import '../../header.dart';

class CustomAppbarPersonil extends StatelessWidget {
  const CustomAppbarPersonil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: SearchField()),
        ProfileInfo(),
      ],
    );
  }
}
