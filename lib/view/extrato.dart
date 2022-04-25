import 'package:flutter/material.dart';

class Extrato extends StatefulWidget {
  const Extrato({ Key? key }) : super(key: key);

  @override
  State<Extrato> createState() => _ExtratoState();
}

class _ExtratoState extends State<Extrato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extrato'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade500,
      ),
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
            //ListTile
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
        ///
        body: ListView(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
          children: const [
            ListTile(
              leading: Icon(Icons.money),
              title: Text('UM, ONE, EINS'),
              subtitle: Text('\$\$\$\$\$'),
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text('DOIS, TWO, ZWEI'),
              subtitle: Text('\$\$\$\$\$'),
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text('TRÊS, THREE, DREI'),
              subtitle: Text('\$\$\$\$\$'),
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text('QUATRO, FOUR, VIER'),
              subtitle: Text('\$\$\$\$\$'),
            ),
          ],
        ),
      
    );
  }
}