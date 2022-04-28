import 'package:flutter/material.dart';
//import 'package:projeto/widgets/drawer.dart';

class CriarUsuario extends StatefulWidget {
  const CriarUsuario({Key? key}) : super(key: key);

  @override
  State<CriarUsuario> createState() => _CriarUsuarioState();
}

class _CriarUsuarioState extends State<CriarUsuario> {
  var formKey = GlobalKey<FormState>();
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar usuário'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade500,
      ),
      //drawer: const AppDrawer(user: 'user'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(100),
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  campoTexto('Nome', txtNome),
                  const SizedBox(height: 10),
                  campoEmail('Email', txtEmail),
                  const SizedBox(height: 10),
                  campoSenha('Definir senha', txtSenha),
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

  campoTexto(rotulo, variavel) {
    return TextFormField(
      controller: variavel,
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(
          fontSize: 10,
          color: Colors.grey.shade500,
        ),
      ),
      validator: (value){
        if(value == ''){return 'Insira um nome.';}
        else {return null;}
      },
    );
  } //campoTexto
  campoEmail(rotulo, variavel) {
    return TextFormField(
      controller: variavel,
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(
          fontSize: 10,
          color: Colors.grey.shade500,
        ),
      ),
      validator: (value){
        String padrao = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^,.()[\],.;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regExp = RegExp(padrao);
        if(value == ''){return 'Insira um email válido';}
        else if(!regExp.hasMatch(value!)){return 'Email inválido.';}
        else {return null;}
      },
    );
  } //campoEmail
  campoSenha(rotulo, variavel) {
    return TextFormField(
      controller: variavel,
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(
          fontSize: 10,
          color: Colors.grey.shade500,
        ),
      ),
      obscureText: true,
      validator: (value){
        if(value == ''){return 'Defina uma senha.';}
        else {return null;}
      },
    );
  } //campoSenha

  ///
  /// BOTAO
  ///
  botaoElevated(rotulo) {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if(formKey.currentState!.validate()){
            String email = txtEmail.text;
            caixaDialogo('Usuário "$email" criado.');
          }
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
          children: <Widget>[
            TextButton(onPressed: (){
              Navigator.of(context).pop();
              Navigator.popAndPushNamed(context, '/telaPrincipal');
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      }
    );
  }//caixaDialogo
}
