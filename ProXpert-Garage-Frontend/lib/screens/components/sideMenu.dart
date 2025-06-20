import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proxpert_garage_frontend/screens/WorkOrderScreen.dart';

import '../dashboardScreen.dart';
import '../mainScreen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              Theme.of(context).brightness == Brightness.dark
                  ? "assets/logos/logoTallerBlanco.png"
                  : "assets/logos/logoTallerNegro.png",
            ),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => MainScreen(child: DashboardScreen()),
                ),
              );
            },
          ),
          DrawerListTile(
            title: "Ordenes de Trabajo",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => MainScreen(child: WorkOrderScreen()),
                ),
              );
            },
          ),
          DrawerListTile(
            title: "Presupuestos",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Clientes",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Inventario",
            svgSrc: "assets/icons/drop_box.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Empleados",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Proveedores",
            svgSrc: "assets/icons/drop_box.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Ajustes",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(
          Theme.of(context).iconTheme.color ?? Colors.black,
          BlendMode.srcIn,
        ),
        height: 16,
      ),
      title: Text(
        title,
          style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}