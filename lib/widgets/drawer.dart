import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto/widgets/mostrar_snackbar.dart';

class AppDrawer extends StatelessWidget {
  final String user;
  const AppDrawer({ Key? key, required this.user }) : super(key: key);

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
              child: Text(user,
                style: const TextStyle(
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
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: (){FirebaseAuth.instance.signOut(); snackbarMsg(context, 'Até mais!'); Navigator.pushNamed(context, '/login');},
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