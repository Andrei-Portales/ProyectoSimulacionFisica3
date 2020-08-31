import 'package:Simulador/screens/menu-parametros.dart';
import 'package:Simulador/screens/simulador.dart';

import './screens/main-menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simulador',
      debugShowCheckedModeBanner: false,
      initialRoute: MainMenu.routeName,
      routes: {
        MainMenu.routeName: (ctx) => MainMenu(),
        MenuParametros.routeName: (ctx) => MenuParametros(),
      },
    );
  }
}
