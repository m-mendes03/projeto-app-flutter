import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import '../widgets/appbar.dart';

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: const Appbar(titulo: 'APP',),
      drawer: const AppDrawer(),
      // floatingActionButton
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.grey.shade800,
        foregroundColor: Colors.yellow.shade800,
        onPressed:(){Navigator.pushNamed(context, '/despesa');},
        tooltip: 'Adiciona despesa',
        ),
        //
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
                    border: Border.all(color: Colors.yellow.shade800),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade300,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height*0.25,
                  width: MediaQuery.of(context).size.width*0.85,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow.shade800),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade300,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height*0.25,
                  width: MediaQuery.of(context).size.width*0.85,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow.shade800),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade300,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height*0.25,
                  width: MediaQuery.of(context).size.width*0.85,
                  color: Colors.grey.shade300,
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height*0.25,
                  width: MediaQuery.of(context).size.width*0.85,
                  color: Colors.grey.shade300,
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height*0.25,
                  width: MediaQuery.of(context).size.width*0.85,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
          ),
        ),
    ); 
  }
}