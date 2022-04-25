import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Despesa extends StatefulWidget {
  const Despesa({ Key? key }) : super(key: key);

  @override
  State<Despesa> createState() => _DespesaState();
}

class _DespesaState extends State<Despesa> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesa'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade500,
        toolbarHeight: 70,
        //leading: IconButton(onPressed: (){Navigator.popAndPushNamed(context, '/telaPrincipal');}, icon: const Icon(Icons.close)),
      ),
      //
      //
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: Column(
                children: [
                  const SizedBox(height: 30),
                  campoTexto('DESPESA'),
                  const SizedBox(height: 30),
                  campoNumerico('***VALOR - NUMÉRICO***'),
                  const SizedBox(height: 30),
                  campoTexto('***DATA - DATE***'),
                  const SizedBox(height: 200),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      botaoTexto('Cancelar'),
                      botaoElevated('Salvar'),
                    ],
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
  ///
  ///campoTexto
  ///
  campoTexto(rotulo){
    return TextFormField(
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: const TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
      ),
    );
  }//campoTexto
  campoNumerico(rotulo){
    return TextFormField(
      keyboardType: const TextInputType.numberWithOptions(decimal: true,),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
      ],
      initialValue: '0.00',
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: const TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
      ),
    );
  }//campoNumerico
  ///
  /// Botões
  ///
  botaoTexto(rotulo) {
    return SizedBox(
      width: 100,
      height: 30,
      child: TextButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, '/telaPrincipal');
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

  ///
  ///
  botaoElevated(rotulo) {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          ///************SALVAR ENTRADA
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
  }//botaoElevated
}