import './menu-parametros.dart';

import '../widgets/main-drawer.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  static const routeName = 'screens/mainmenu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('Menu'),
      ),
      drawer: MainDrawer(),
      body: ListView(
        children: [
          InkWell(
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/opcion1.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                height: 100,
                child: Center(
                    child: Container(
                  padding: EdgeInsets.all(15),
                  color: Colors.black54,
                  child: Text(
                    'Trayectoria de particula en campo electrico',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                )),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(MenuParametros.routeName);
            },
          ),
        ],
      ),
    );
  }
}
