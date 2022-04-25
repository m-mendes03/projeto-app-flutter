import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget{
  final String titulo;
  const Appbar({
    Key? key,
    required this.titulo,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(50.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titulo, style: const TextStyle(color: Colors.white70)),
      centerTitle: true,
      backgroundColor: Colors.blueGrey.shade500,
    );
  }
}