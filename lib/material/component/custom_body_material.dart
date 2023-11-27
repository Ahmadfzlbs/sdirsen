import 'package:flutter/cupertino.dart';

import 'body_material.dart';

class CustomBodyMaterial extends StatelessWidget {
  const CustomBodyMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: BodyFieldMaterial()),
      ],
    );
  }
}