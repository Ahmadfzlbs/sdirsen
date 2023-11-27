import 'package:flutter/material.dart';
import 'package:sdirbinsen/personil/component/search_personil.dart';

import '../../header.dart';

class CustomAppbarUser extends StatelessWidget {
  const CustomAppbarUser({Key? key}) : super(key: key);

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
