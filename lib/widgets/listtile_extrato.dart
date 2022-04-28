import 'package:flutter/material.dart';

ListTile listaExtrato(variavel) {
    return ListTile(
            leading: const Icon(Icons.money),
            title: Text(variavel),
            subtitle: const Text('\$\$\$\$\$'),
          );
  }