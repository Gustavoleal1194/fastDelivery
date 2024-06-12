import 'package:flutter/material.dart';

class ShowDialogConfirm {
  static Future<void> show(BuildContext ctx) async {
    await showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sucesso'),
          content: const Text('Sua conta foi criada com sucesso!'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pushNamed(context, '/'); // Fecha o modal
              },
            ),
          ],
        );
      },
    );
  }
}
