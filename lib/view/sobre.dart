import 'package:flutter/material.dart';
import 'package:projeto/widgets/appbar.dart';
import 'package:projeto/widgets/drawer.dart';

class Sobre extends StatelessWidget {
  const Sobre({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(titulo: 'Sobre'),
      // drawer
      drawer: const AppDrawer(),
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