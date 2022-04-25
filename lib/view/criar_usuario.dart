import 'package:flutter/material.dart';

class CriarUsuario extends StatefulWidget {
  const CriarUsuario({Key? key}) : super(key: key);

  @override
  State<CriarUsuario> createState() => _CriarUsuarioState();
}

class _CriarUsuarioState extends State<CriarUsuario> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar usuário'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade500,
      ),
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
            //ListTile
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(100),
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  campoTexto('Nome', 'Var'),
                  const SizedBox(height: 10),
                  campoTexto('Email', 'Var'),
                  const SizedBox(height: 10),
                  campoTexto('Definir senha', 'Var'),
                  const SizedBox(height: 30),
                  botaoElevated('Criar Usuário'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///
  ///
  campoTexto(rotulo, variavel) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(
          fontSize: 10,
          color: Colors.grey.shade500,
        ),
      ),
    );
  } //campoTexto

  ///
  /// BOTAO
  ///
  botaoElevated(rotulo) {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          caixaDialogo('Usuário criado.');
          },
        child: Text(
          rotulo,
          style: const TextStyle(fontSize: 18),
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.yellow.shade900),
        ),
      ),
    );
  }//botaoElevated
  caixaDialogo(rotulo){
    return showDialog(
      context: (context),
      builder: (BuildContext context){
        return SimpleDialog(
          title: Text(rotulo),
          /*actions: <Widget>[
            TextButton(
              child: Text(rotulo),
              onPressed: (){Navigator.of(context).pop();},
            ),
          ],*/
          children: <Widget>[
            TextButton(onPressed: (){Navigator.of(context).pop(); Navigator.popAndPushNamed(context, '/telaPrincipal');}, child: const Text('Fechar'),)
          ],
        );
      }
    );
  }//caixaDialogo
}
