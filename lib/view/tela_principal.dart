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
        backgroundColor: Colors.white10,
        iconSize: 50,
        onTap: _onItemTapped,
      ),
        // body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children:[
              Container(
                margin: const EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height*0.25,
                width: MediaQuery.of(context).size.width*0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: 
                Image.network('https://cdn.pixabay.com/photo/2020/07/08/04/12/work-5382501_960_720.jpg', scale: 5,),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height*0.25,
                width: MediaQuery.of(context).size.width*0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: 
                Image.network('https://cdn.pixabay.com/photo/2015/01/08/18/27/startup-593341_960_720.jpg', scale: 5,),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height*0.25,
                width: MediaQuery.of(context).size.width*0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: 
                Image.network('https://cdn.pixabay.com/photo/2016/11/19/14/00/code-1839406_960_720.jpg', scale: 5,),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height*0.25,
                width: MediaQuery.of(context).size.width*0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: 
                Image.network('https://cdn.pixabay.com/photo/2016/06/03/13/57/digital-marketing-1433427_960_720.jpg', scale: 5,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}