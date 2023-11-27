import 'package:flutter/cupertino.dart';

import 'body_personil.dart';

class CustomBodyPersonil extends StatelessWidget {
  const CustomBodyPersonil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: BodyFieldPersonil()),
      ],
    );
  }
}