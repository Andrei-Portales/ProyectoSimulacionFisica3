import 'package:Simulador/screens/main-menu.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green[900]),
            child: Image.asset('assets/images/logo_transparente.png'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Menu principal',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(MainMenu.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Ajustes',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
