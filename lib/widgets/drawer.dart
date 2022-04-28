import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade500,
              ),
              child: const Text('Aplicativo',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  ),
              ),
            ),
            // ListTile
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Início'),
              onTap: (){Navigator.popAndPushNamed(context, '/telaPrincipal');},
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Extrato'),
              onTap: (){Navigator.pushNamed(context, '/extrato');},
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Fazer login'),
              onTap: (){Navigator.pushNamed(context, '/login');},
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre'),
              onTap: (){Navigator.pushNamed(context, '/sobre');},
            ),
          ],
        ),
    );
  }
}