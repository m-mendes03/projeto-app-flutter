import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({ Key? key }) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APP'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade500,
      ),
      // drawer
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
            // ListTile
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