import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade500,
      ),
      // drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade500,
              ),
              child: const Text('***DRAWER***',
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
        ),
        body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.info),
                  Text('Weird dev who does not like this app, but it is having fun doing it.'),
                ],
              ),
    );
  }
}