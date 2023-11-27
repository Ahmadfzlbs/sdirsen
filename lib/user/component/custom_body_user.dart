import 'package:flutter/cupertino.dart';

import 'body_user.dart';

class CustomBodyUser extends StatelessWidget {
  const CustomBodyUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: BodyFieldUser()),
      ],
    );
  }
}