import 'package:flutter/material.dart';

class ShowDialogConfirmEmail {
  static Future<void> show(BuildContext ctx) async {
    await showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sucesso'),
          content:
              const Text('enviamos um e-mail para sua conta de recuperação'),
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
