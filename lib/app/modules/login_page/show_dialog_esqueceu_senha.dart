import 'package:estudo_flutter/app/modules/helpers/validators/email_validator.dart';
import 'package:estudo_flutter/app/modules/login_page/show_dialog_confirm_email.dart';
import 'package:flutter/material.dart';

class ShowDialogEsqueceuSenha {
  static Future<void> show(BuildContext ctx) async {
    TextEditingController emailController = TextEditingController();
    await showDialog(
        context: ctx,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Esqueceu a senha?'),
            actions: <Widget>[
              TextFormField(
                controller: emailController,
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
                  {
                    String? emailValidationResult =
                        EmailValidator.validate(emailController.text);
                    if (emailValidationResult == null) {
                      ShowDialogConfirmEmail.show(
                        context,
                      );
                    } else {
                      ScaffoldMessenger.of(ctx).showSnackBar(
                        SnackBar(
                          content: Text(emailValidationResult),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          );
        });
  }
}
