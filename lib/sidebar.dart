import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdirbinsen/personil/personil_screen.dart';
import 'package:sdirbinsen/user/user_screen.dart';
import 'package:sidebarx/sidebarx.dart';

import 'constants.dart';
import 'dashboard/dashboard_screen.dart';
import 'material/material_screen.dart';

class SidebarMenu extends StatelessWidget {
  SidebarMenu({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu, color: Colors.grey),
              ),
            )
                : null,
            drawer: Sidebar(controller: _controller),
            body: Row(
              children: [
                if(!isSmallScreen) Sidebar(controller: _controller),
                Expanded(child: Center(child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context,child){
                    switch(_controller.selectedIndex){
                      case 0: _key.currentState?.closeDrawer();
                      return DashboardScreen(controller: _controller);
                      case 1: _key.currentState?.closeDrawer();
                      return UserScreen(controller: _controller);
                      case 2: _key.currentState?.closeDrawer();
                      return PersonilScreen(controller: _controller);
                      case 3: _key.currentState?.closeDrawer();
                      return MaterialScreen(controller: _controller);
                      // case 4: _key.currentState?.closeDrawer();
                      // return UserScreen(controller: _controller);
                      default:
                        return DashboardScreen(controller: _controller);
                    }
                  },
                ),))
              ],
            )
          );
        }
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: bgColor,
        hoverTextStyle: TextStyle(color: Colors.black),
        textStyle: TextStyle(color: Colors.black),
        selectedTextStyle: const TextStyle(color: Colors.black),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: bgColor.withOpacity(0.37),
          ),
          color: bgColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: const IconThemeData(
          color: Colors.redAccent,
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.redAccent,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
                "https://png.pngtree.com/png-clipart/20221030/original/pngtree-the-indonesian-national-armed-forces-logo-is-suitable-for-infantry-day-png-image_8743717.png"),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Dashboard',
        ),
        SidebarXItem(
          icon: Icons.person_add,
          label: 'User',
        ),
        SidebarXItem(
          icon: Icons.person,
          label: 'Personil',
        ),
        SidebarXItem(
          icon: Icons.document_scanner,
          label: 'Material',
        ),
        SidebarXItem(
          icon: Icons.logout,
          label: 'Logout',
        ),
        // const SidebarXItem(
        //   iconWidget: FlutterLogo(size: 20),
        //   label: 'Flutter',
        // ),
      ],
    );
  }
}

final divider = Divider(color: Colors.white.withOpacity(0.3), height: 1);


