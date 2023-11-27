import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdirbinsen/user/user_content.dart';
import 'package:sidebarx/sidebarx.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          switch (controller.selectedIndex) {
            case 1:
              return SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: UserContent(),
                    )
                  ],
                ),
              );
            default:
              return UserScreen(controller: controller);
          }
        },
      ),
    );
  }
}