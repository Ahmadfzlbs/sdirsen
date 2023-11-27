import 'package:flutter/material.dart';

import '../../header.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: SearchField()),
        ProfileInfo()
      ],
    );
  }
}
