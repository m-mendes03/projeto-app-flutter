import 'package:flutter/material.dart';
import 'package:projeto/widgets/drawer.dart';

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
      drawer: const AppDrawer(),
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
