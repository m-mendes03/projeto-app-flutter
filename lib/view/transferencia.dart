import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/mostrar_snackbar.dart';

class Transferencia extends StatefulWidget {
  const Transferencia({ Key? key }) : super(key: key);

  @override
  State<Transferencia> createState() => _TransferenciaState();
}

class _TransferenciaState extends State<Transferencia> {
  var formKey = GlobalKey<FormState>();
  var txtOrigem = TextEditingController();
  var txtDestino = TextEditingController();
  var valor = TextEditingController();
  var data = TextEditingController();
  retornarDocumentoById(id) async{
    await FirebaseFirestore.instance
      .collection('registros')
      .doc(id)
      .get()
      .then((doc){
        txtOrigem.text = doc.get('origem');
        txtDestino.text = doc.get('destino');
        valor.text = doc.get('valor').toString();
        data.text = doc.get('data').toString();
      });
  }
  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)!.settings.arguments;
    if(id != null){
      if(txtOrigem.text.isEmpty && valor.text.isEmpty){
        retornarDocumentoById(id);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('TransferĂȘncia'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade500,
        toolbarHeight: 70,
        leading: IconButton(onPressed: (){Navigator.popAndPushNamed(context, '/telaPrincipal');}, icon: const Icon(Icons.close)),
      ),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: Column(
                children: [
                  const SizedBox(height: 30),
                  campoTexto('Conta de origem', txtOrigem, 'Insira uma origem.'),
                  const SizedBox(height: 30),
                  campoTexto('Conta destino', txtDestino, 'Insira um destino.'),
                  const SizedBox(height: 30),
                  campoNumerico('Valor', valor, 'Insira um valor.'),
                  const SizedBox(height: 30),
                  campoData('Data', data),
                  const SizedBox(height: 150),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      botaoTexto('Cancelar'),
                      botaoElevated('Salvar', id: id),
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
  campoTexto(rotulo, variavel, aviso){
    return TextFormField(
      controller: variavel,
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: const TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
      ),
      validator: (value){
        if(value == ''){ return aviso;}
        else {return null;}
      },
    );
  }//campoTexto
  campoNumerico(rotulo, variavel, aviso){
    return TextFormField(
      controller: variavel,
      keyboardType: const TextInputType.numberWithOptions(decimal: true,),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
      ],
      decoration: InputDecoration(
        labelText: rotulo,
        hintText: '1.234,56',
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
      ),
      validator: (value){
        if(value == ''){ return aviso;}
        else {return null;}
      },
    );
  }//campoNumerico
  campoData(rotulo, variavel){
    return TextFormField(
      controller: variavel,
      keyboardType: const TextInputType.numberWithOptions(decimal: false,),
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: const TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
        hintText: 'dd-MM-yyyy',
        hintStyle: const TextStyle(color: Colors.grey),
      ),
      validator: (value){
        RegExp regExp = RegExp(r'^([0-2][0-9]|(3)[0-1])(\-)(((0)[0-9])|((1)[0-2]))(\-)\d{4}$');
        if(value == ''){return 'Insira uma data vĂĄlida';}
        else if(!regExp.hasMatch(value!)){return 'Formato de data invĂĄlida. Usar formato dd-mm-aaaa.';}        
        else {return null;}
      },
    );
  }//campoData
  ///
  /// BotĂ”es
  ///
  botaoTexto(rotulo) {
    return SizedBox(
      width: 100,
      height: 30,
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
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

  botaoElevated(rotulo, {id}) {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if(formKey.currentState!.validate()){
            if(id == null){
              FirebaseFirestore.instance
              .collection('registros')
              .add(
                {
                  "tipo": 'transferencia',
                  "uid": FirebaseAuth.instance.currentUser!.uid,
                  "origem": txtOrigem.text,
                  "destino": txtDestino.text,
                  "valor": double.parse(valor.text),
                  "data": data.text,
                }
              );
              snackbarMsg(context, 'Item adicionado: '+ txtOrigem.text);
            }else{
              FirebaseFirestore.instance
              .collection('registros')
              .doc(id.toString())
              .set(
                {
                  "tipo": 'transferencia',
                  "uid": FirebaseAuth.instance.currentUser!.uid,
                  "origem": txtOrigem.text,
                  "destino": txtDestino.text,
                  "valor": double.parse(valor.text),
                  "data": data.text,
                }
              );
              snackbarMsg(context, 'TransferĂȘncia atualizada.');
            }
            Navigator.pop(context);
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
  }//botaoElevated
}