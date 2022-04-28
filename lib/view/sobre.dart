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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Image.asset('lib/imagens/avatar.jpg', scale: 1.5,),
            ],
          ),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.8,
                child: const Text(
                  'Este é um projeto de um aplicativo para entradas e saídas financeiras.\nFoi desenvolvido para a disciplina de "Programação para Dispositivos Móveis" na FATEC Ribeirão Preto.'
                ),
              ),
            ],
          ),
          const SizedBox(height: 100,),
          const Icon(Icons.info),
        ],
      ),
    );
  }
}