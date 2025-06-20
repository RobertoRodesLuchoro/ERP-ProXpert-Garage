import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/menu_app_controller.dart';
import '../responsive.dart';
import 'components/sideMenu.dart';
import 'dashboardScreen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/menu_app_controller.dart';
import '../responsive.dart';
import 'components/sideMenu.dart';

class MainScreen extends StatelessWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menú lateral solo en pantallas grandes
            if (Responsive.isDesktop(context))
              const Expanded(
                child: SideMenu(),
              ),
            Expanded(
              flex: 5,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
