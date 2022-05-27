import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'mostrar_snackbar.dart';

ListTile listaExtrato(context, item, descricao, valor) {
    return ListTile(
            leading: const Icon(Icons.money),
            title: Text(descricao),
            subtitle: Text(valor),
            // remover um registro
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () {
                FirebaseFirestore.instance
                  .collection('registros').doc(item.id).delete();
                snackbarMsg(context, 'Registro removido.');
              },
            ),
            /// ALTERAR : LEVAR PARA A TELA CORRESPONDENTE
            onTap: () {
              Navigator.pushNamed(
                context,
                '/despesa',
                arguments: item.id,
              );
            },
          );
  }