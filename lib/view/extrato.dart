import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto/widgets/drawer.dart';
import 'package:projeto/widgets/listtile_extrato.dart';
import '../widgets/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Extrato extends StatefulWidget {
  const Extrato({ Key? key }) : super(key: key);

  @override
  State<Extrato> createState() => _ExtratoState();
}

class _ExtratoState extends State<Extrato> {
  var registros;
  @override
  void initState() {
    super.initState();
    registros = FirebaseFirestore.instance
        .collection('registros')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(titulo: 'Extrato',),
      drawer: AppDrawer(user: FirebaseAuth.instance.currentUser!.email.toString()),
        body: Container(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: 
            StreamBuilder<QuerySnapshot>(
            stream: registros.snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(child: Text('Não foi possível conectar.'));
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                  final dados = snapshot.requireData;
                  return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      return exibirTransacoes(dados.docs[index]);
                    },
                  );
              }
            },
          ),
        ),
    );
  }
    exibirTransacoes(item) {
      String descricao = item.data()['descricao'] ?? item.data()['origem'] + ' -> ' + item.data()['destino'];
      String valor = item.data()['valor'].toString();
      String data = item.data()['data'] ?? '';
      String tipo = item.data()['tipo'];
      return listaExtrato(context, item, descricao, valor, data, tipo);
  }
}