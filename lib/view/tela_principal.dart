import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import '../widgets/appbar.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({ Key? key }) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _estadoSelecionado = 0;
  var despesas;
  var receitas;
  double somaDespesa = 0.0;
  double somaReceita = 0.0;

  static const List<String> _telas = <String>[
    '/despesa', '/receita', '/transferencia'
  ];

  void _onItemTapped(int indice){
    setState(() {
      _estadoSelecionado = indice;
      Navigator.pushNamed(context, _telas[_estadoSelecionado]);
    });
  }
  @override
  void initState() {
    super.initState();
    despesas = FirebaseFirestore.instance
        .collection('registros')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('tipo', isEqualTo: 'despesa');
    receitas = FirebaseFirestore.instance
        .collection('registros')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('tipo', isEqualTo: 'receita');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(titulo: 'APP',),
      drawer: AppDrawer(user: FirebaseAuth.instance.currentUser!.email.toString()),
      bottomNavigationBar: BottomNavigationBar(        
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.arrow_downward, color: Colors.red,), label: 'Despesa'),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_upward, color: Colors.green,), label: 'Receita'),
          BottomNavigationBarItem(icon: Icon(Icons.swap_vert, color: Colors.teal,), label: 'Transferência'),
        ],
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white60,
        iconSize: 50,
        onTap: _onItemTapped,
      ),
        // body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children:[
              StreamBuilder<QuerySnapshot>(
                stream: despesas.snapshots(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Center(child: Text('Sem conexão.'));
                    case ConnectionState.waiting:
                      return const Center(child: CircularProgressIndicator());
                    default:
                    final dados = snapshot.requireData;
                    somaDespesa = somas(dados.size, dados);
                    return Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300,
                      ),
                      child: 
                      Text("Despesas: \n\nR\$ " + somaDespesa.toStringAsFixed(2),
                      style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),
                      textAlign: TextAlign.center),
                    );
                  }
                },
              ),
              StreamBuilder<QuerySnapshot>(
                stream: receitas.snapshots(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Center(child: Text('Sem conexão.'));
                    case ConnectionState.waiting:
                      return const Center(child: CircularProgressIndicator());
                    default:
                    final dados = snapshot.requireData;
                    somaReceita = somas(dados.size, dados);
                    return Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300,
                      ),
                      child: 
                      Text("Receitas: \n\nR\$ " + somaReceita.toStringAsFixed(2),
                      style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),
                      textAlign: TextAlign.center),
                    );
                  }
                },
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height*0.15,
                width: MediaQuery.of(context).size.width*0.65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: 
                Text("Balanço: \n\nR\$ " + (somaReceita-somaDespesa).toStringAsFixed(2),
                style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),
                textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ),
    );
  }
  balanco(receita, despesa){
    double balanco = receita - despesa;
    return balanco;
  }
  somas(size, dados){
    double soma = 0.0;
    for(int i = 0; i < size; i++){
      soma += double.parse(dados.docs[i].data()['valor'].toString());
    }
    return soma;
  }
}