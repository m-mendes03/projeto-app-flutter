import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/caixa_dialogo.dart';

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
  var txtCPF = TextEditingController();
  var txtTelefone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar usuário'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade500,
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
                  campoTexto('Nome', txtNome, 'Insira um nome'),
                  const SizedBox(height: 10),
                  campoEmail('Email', txtEmail),
                  const SizedBox(height: 10),
                  campoTexto('CPF', txtCPF, 'Insira um CPF', hint: '999.999.999-99'),
                  const SizedBox(height: 10),
                  campoTexto('Telefone', txtTelefone, 'Insira um telefone', hint: '99-999999999'),
                  const SizedBox(height: 10),
                  campoSenha('Definir senha', txtSenha),
                  const SizedBox(height: 30),
                  botaoElevated('Criar Usuário'),
                  const SizedBox(height: 5),
                  botaoTexto('Cancelar'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  campoTexto(rotulo, variavel, aviso, {hint}) {
    return TextFormField(
      controller: variavel,
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(
          fontSize: 10,
          color: Colors.grey.shade500,
        ),
        hintText: hint ?? '',
        hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      validator: (value){
        if(value == ''){return aviso;}
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
        if(value == ''){return 'Defina uma senha';}
        else {return null;}
      },
    );
  } //campoSenha

  ///
  /// BOTAO
  ///
  botaoTexto(rotulo) {
    return SizedBox(
      width: 100,
      height: 30,
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          rotulo,
          style: const TextStyle(fontSize: 12),
        ),
        style: TextButton.styleFrom(
          primary: Colors.grey.shade600,
        ),
      ),
    );
  }//botaoTexto
  botaoElevated(rotulo) {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if(formKey.currentState!.validate()){
            criarConta(txtNome.text, txtEmail.text, txtSenha.text, txtCPF.text, txtTelefone.text);
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
  
  ///
  ///CRIAR CONTA
  ///
  void criarConta(nome, email, senha, cpf, telefone){
    FirebaseAuth.instance
    .createUserWithEmailAndPassword(email: email, password: senha)
    .then((res){
      FirebaseFirestore.instance.collection('usuarios')
          .add(
            {
              "uid" : res.user!.uid.toString(),
              "nome" : nome,
              "cpf" : cpf,
              "telefone" : telefone
            }
          );
      Navigator.pop(context);
    }).catchError((e){
      switch(e.code){
        case 'email-already-in-use':
            caixaDialogo(context, 'O email já foi cadastrado.');
            break;
          case 'invalid-email':
            caixaDialogo(context, 'O email é inválido.');
            break;
          default:
            caixaDialogo(context, e.code.toString());
      }
    });
  }
}
