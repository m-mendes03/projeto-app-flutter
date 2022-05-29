import 'package:flutter/material.dart';

caixaDialogo(context, rotulo){
    return showDialog(
      context: (context),
      builder: (BuildContext context){
        return SimpleDialog(
          title: Text(rotulo),
          children: <Widget>[
            TextButton(onPressed: (){
              Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      }
    );
  }//caixaDialogo