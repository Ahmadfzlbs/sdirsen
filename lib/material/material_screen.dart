import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdirbinsen/material/material_content.dart';
import 'package:sidebarx/sidebarx.dart';

class MaterialScreen extends StatelessWidget {
  const MaterialScreen({
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
            case 3:
              return SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: MaterialContent(),
                    )
                  ],
                ),
              );
            default:
              return MaterialScreen(controller: controller);
          }
        },
      ),
    );
  }
}