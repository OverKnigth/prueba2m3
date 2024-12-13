import 'package:flutter/material.dart';
import 'package:prueba_001/main.dart';
import 'package:prueba_001/screens/screen4.dart';
import 'package:prueba_001/screens/screen5.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Citas"),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Citas())),
          ),
          ListTile(
            title: Text("Servicios"),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Servicios())),
          ),
        ],
      ),
    );
  }
}
