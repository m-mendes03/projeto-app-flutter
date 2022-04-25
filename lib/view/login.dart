import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(color: Colors.white70),),
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
                child: Column(
                  children: [
                    const SizedBox(height: 20),                    
                    Image.asset('lib/imagens/grade.jpg', scale: 6),
                    const SizedBox(height: 50),
                    campoTexto('Email', 'Var'),
                    const SizedBox(height: 20),
                    campoSenha('Senha', 'Var'),
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
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(
          fontSize: 10,
          color: Colors.grey.shade500,
        ),
      ),
    );
  } //campoTexto
  
  campoSenha(rotulo, variavel) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(
          fontSize: 10,
          color: Colors.grey.shade500,
        ),
      ),
      obscureText: true,
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
          ///************VERIFICAR LOGIN
          Navigator.popAndPushNamed(context, '/telaPrincipal');
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
