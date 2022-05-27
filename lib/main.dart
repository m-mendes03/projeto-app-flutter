import 'package:flutter/material.dart';
import 'package:projeto/view/tela_principal.dart';
import 'package:projeto/view/transferencia.dart';
import 'package:projeto/view/login.dart';
import 'package:projeto/view/criar_usuario.dart';
import 'package:projeto/view/extrato.dart';
import 'package:projeto/view/sobre.dart';
import 'package:projeto/view/despesa.dart';
import 'package:projeto/view/receita.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

///
///telas:
///TelaPrincipal()
///Login()
///CriarUsuario()
///Extrato()
///Sobre()
///Despesa()
///Receita()
///Transferencia()
///

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      initialRoute: '/login',
      routes: {
        '/telaPrincipal': (context) => const TelaPrincipal(),
        '/login': (context) => const Login(),
        '/criarUsuario': (context) => const CriarUsuario(),
        '/extrato': ((context) => const Extrato()),
        '/sobre': ((context) => const Sobre()),
        '/despesa': ((context) => const Despesa()),
        '/receita': ((context) => const Receita()),
        '/transferencia': ((context) => const Transferencia()),
      },
    ),
  );
}