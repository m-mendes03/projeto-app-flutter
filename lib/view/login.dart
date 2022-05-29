import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto/widgets/caixa_dialogo.dart';
import 'package:projeto/widgets/mostrar_snackbar.dart';
import '../widgets/appbar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formKey = GlobalKey<FormState>();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const Appbar(titulo: 'Login'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(100),
            child: Form(
              key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),                    
                    Image.asset('lib/imagens/grade.jpg', scale: 6),
                    const SizedBox(height: 50),
                    campoEmail('Email', txtEmail),
                    const SizedBox(height: 20),
                    campoSenha('Senha', txtSenha),
                    const SizedBox(height: 20),
                    botaoElevated('Fazer Login'),
                    const SizedBox(height: 5),
                    botaoTexto('Criar login'),
                  ],
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
        value = value!;
        if(value == ''){ return 'Insira um email.';}
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
        if(value == ''){return 'Insira a senha.';}
        else {return null;}
      },
    );
  } //campoSenha

  ///
  /// BOTÃO
  ///
  botaoTexto(rotulo) {
    return SizedBox(
      width: 100,
      height: 30,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/criarUsuario');
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
  }
  botaoElevated(rotulo) {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if(formKey.currentState!.validate()){
            login(txtEmail.text, txtSenha.text);
          }
        },
        child: Text(
          rotulo,
          style: const TextStyle(fontSize: 22),
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.amber.shade700),
        ),
      ),
    );
  }
  ///
  /// LOGIN
  /// 
  void login(email, senha){
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: senha)
    .then((res){
      snackbarMsg(context, 'Login realizado.');
      Navigator.popAndPushNamed(context, '/telaPrincipal');
    })
    .catchError((e){
      switch(e.code){
        case 'invalid-email': caixaDialogo(context, 'Email inválido.'); break;
        case 'user-not-found': caixaDialogo(context, 'Usuário não encontrado.'); break;
        case 'wrong-password': caixaDialogo(context, 'Senha incorreta.'); break;
        default: caixaDialogo(context, e.code.toString());
      }
    });
  }
}
