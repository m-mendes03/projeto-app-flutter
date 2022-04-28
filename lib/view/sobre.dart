import 'package:flutter/material.dart';
import 'package:projeto/view/login.dart';
import 'package:projeto/widgets/appbar.dart';
import 'package:projeto/widgets/drawer.dart';

class Sobre extends StatelessWidget {
  const Sobre({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(titulo: 'Sobre'),
      // drawer
      drawer: AppDrawer(user: userName),
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
                width: MediaQuery.of(context).size.width*0.85,
                child: const Text(
                  'Este é um projeto de um aplicativo para entradas e saídas financeiras.\nO objetivo do app é manter um histórico movimentações financeiras feitas pelo usuário.\n\n\nO app não está finalizado e está sendo desenvolvido por Marina Mendes.'
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