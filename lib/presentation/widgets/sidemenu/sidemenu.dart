import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:indumentariastock/config/menu/menu_items.dart';


class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final textTheme = Theme.of(context).textTheme;
    /*
     if(Platform.isAndroid){
      print('Android $hasNotch');
    }else{
      print('${Platform.isWindows} $hasNotch');
    }
     */


    return NavigationDrawer(
      indicatorColor: Colors.transparent,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });
          final menuItem = appMenuItems[value];
          context.push(menuItem.link);
          //Para llamar al state usamos la palabra reservada widget
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        selectedIndex: navDrawerIndex,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(28,hasNotch ? 0 : 20,16,10),
            child: Text("Productos",style: textTheme.titleMedium),
          ),
          ...appMenuItems
              .sublist(0,3)
              .map((item) => NavigationDrawerDestination(icon: Icon(item.icon), label: Text(item.title))),
          const Padding(padding: EdgeInsets.fromLTRB(28, 8,16,10),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(28,hasNotch ? 0 : 10,16,10),
            child:  Text("Empleados",style: textTheme.titleMedium),
          ),
          ...appMenuItems
              .sublist(3,4)
              .map((item) => NavigationDrawerDestination(icon: Icon(item.icon), label: Text(item.title))),
          const Padding(padding: EdgeInsets.fromLTRB(28, 8,16,10),
          child: Divider()),
          Padding(
            padding: EdgeInsets.fromLTRB(28,hasNotch ? 0 : 10,16,10),
            child:  Text("Reporte",style: textTheme.titleMedium),
          ),
          ...appMenuItems
              .sublist(4,6)
              .map((item) => NavigationDrawerDestination(icon: Icon(item.icon), label: Text(item.title))),
          const Padding(padding: EdgeInsets.fromLTRB(28, 8,16,10),
              child: Divider()),
          Padding(
            padding: EdgeInsets.fromLTRB(28,hasNotch ? 0 : 10,16,10),
            child:  Text("Configuracion",style: textTheme.titleMedium),
          ),
          ...appMenuItems
          .sublist(6)
          .map((item) => NavigationDrawerDestination(icon: Icon(item.icon), label: Text(item.title)))
        ]
    );
  }
}