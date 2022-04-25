import 'package:flutter/material.dart';
import 'package:projeto/widgets/drawer.dart';
import '../widgets/appbar.dart';

class Extrato extends StatelessWidget {
  const Extrato({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(titulo: 'Extrato',),
      drawer: const AppDrawer(),
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