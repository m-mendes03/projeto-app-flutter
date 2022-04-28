import 'package:flutter/material.dart';
import 'package:projeto/view/login.dart';
import 'package:projeto/widgets/drawer.dart';
import '../widgets/appbar.dart';
import '../widgets/listtile_extrato.dart';

class Extrato extends StatelessWidget {
  const Extrato({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(titulo: 'Extrato',),
      drawer: AppDrawer(user: userName),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
          children: [
            listaExtrato('A'),
            listaExtrato('B'),
            listaExtrato('C'),
            listaExtrato('D'),
            listaExtrato('E'),
            listaExtrato('F'),
            listaExtrato('G'),
            listaExtrato('H'),
            listaExtrato('I'),
            listaExtrato('J'),
            listaExtrato('K'),
            listaExtrato('L'),
            listaExtrato('M'),
            listaExtrato('N'),
            listaExtrato('O'),
            listaExtrato('P'),
            listaExtrato('Q'),
            listaExtrato('R'),
          ],
        ),
    );
  }
}