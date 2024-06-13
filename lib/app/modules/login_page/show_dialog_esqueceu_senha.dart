import 'package:estudo_flutter/app/modules/login_page/show_dialog_confirm_email.dart';
import 'package:flutter/material.dart';

class ShowDialogEsqueceuSenha {
  static Future<void> show(BuildContext ctx) async {
    await showDialog(
        context: ctx,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Esqueceu a senha?'),
            actions: <Widget>[
              TextFormField(
                cursorColor: Colors.black,
                maxLines: 1,
                textAlign: TextAlign.start,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  counterText: '',
                  border: OutlineInputBorder(),
                  labelText: 'e-mail de recuperação',
                ),
              ),
              TextButton(
                child: const Text('Enviar'),
                onPressed: () {
                  ShowDialogConfirmEmail.show(context);
                },
              ),
            ],
          );
        });
  }
}
