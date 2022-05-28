import 'package:flutter/material.dart';

void snackbarMsg(context, rotulo){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(rotulo),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.orange.shade700,
      ),
    );
  }