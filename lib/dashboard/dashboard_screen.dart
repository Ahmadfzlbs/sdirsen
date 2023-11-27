import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import 'dashboard_content.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
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
          final pageTitle = _getTitleByIndex(controller.selectedIndex);
          switch (controller.selectedIndex) {
            case 0:
              return SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: DashboardContent(),
                    )
                  ],
                ),
              );
            default:
              return Text(
                pageTitle,
                style: theme.textTheme.headlineSmall,
              );
          }
        },
      ),
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Dashboard';
    case 1:
      return 'Personil';
    case 2:
      return 'Material';
    case 3:
      return 'Logout';
    case 4:
      return 'Custom iconWidget';
    default:
      return 'Not found page';
  }
}

