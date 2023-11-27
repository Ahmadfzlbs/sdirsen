import 'package:flutter/cupertino.dart';

import 'body.dart';

class CustomBody extends StatelessWidget {
  const CustomBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: BodyField()),
        // ProfileInfo()
      ],
    );
  }
}
