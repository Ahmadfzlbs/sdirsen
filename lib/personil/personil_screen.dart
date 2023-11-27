import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdirbinsen/personil/personil_content.dart';
import 'package:sidebarx/sidebarx.dart';

class PersonilScreen extends StatelessWidget {
  const PersonilScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          switch (controller.selectedIndex) {
            case 2:
              return SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: PersonilContent(),
                    )
                  ],
                ),
              );
            default:
              return PersonilScreen(controller: controller);
          }
        },
      ),
    );
  }
}
