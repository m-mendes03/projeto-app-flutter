import 'package:flutter/material.dart';
import 'package:projeto/view/tela_principal.dart';
import '/view/tela_principal.dart';
import '/view/login.dart';
import '/view/criar_usuario.dart';
import '/view/extrato.dart';
import '/view/sobre.dart';
import 'view/despesa.dart';
import '/view/receita.dart';

///
///telas:
///TelaPrincipal()
///Login()
///CriarUsuario()
///Extrato()
///Sobre()
///Despesa()
///Receita()
///

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      initialRoute: '/telaPrincipal',
      routes: {
        '/telaPrincipal': (context) => const TelaPrincipal(),
        '/login': (context) => const Login(),
        '/criarUsuario': (context) => const CriarUsuario(),
        '/extrato': ((context) => const Extrato()),
        '/sobre': ((context) => const Sobre()),
        '/despesa': ((context) => const Despesa()),
        '/receita': ((context) => const Receita()),
      },
    ),
  );
}
