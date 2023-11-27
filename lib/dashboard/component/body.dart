import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdirbinsen/constants.dart';

import '../../responsive.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isMobile(context))
          Expanded(child: BodyField()),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: BodyField()),
      ],
    );
  }
}

class BodyField extends StatelessWidget {
  const BodyField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Dashboard",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                color: orangeColor,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
            Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                  color: infoColor,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                  color: successColor,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                  color: warningColor,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          ],
        ),
      ],
    );
  }
}

