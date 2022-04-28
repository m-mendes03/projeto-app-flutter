import 'package:flutter/material.dart';
import 'package:projeto/widgets/drawer.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const Appbar(titulo: 'Login'),
      drawer: const AppDrawer(),
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
                    campoTexto('Email', txtEmail),
                    const SizedBox(height: 20),
                    campoSenha('Senha', txtSenha),
                    const SizedBox(height: 20),
                    botaoElevated('Fazer Login'),
                    botaoTexto('Criar login'),
                  ],
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

  ///
  ///
  botaoElevated(rotulo) {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if(formKey.currentState!.validate()){
            Navigator.popAndPushNamed(context, '/telaPrincipal');
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
}
