import 'package:estudo_flutter/app/modules/helpers/validators/email_validator.dart';
import 'package:estudo_flutter/app/modules/registrar_page/show_dialog_confirm.dart';
import 'package:estudo_flutter/app/modules/registrar_page/phone_class_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrarPage extends StatefulWidget {
  const RegistrarPage({super.key});

  @override
  State<RegistrarPage> createState() => _RegistrarPageState();
}

class _RegistrarPageState extends State<RegistrarPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _dataNascimentoController = TextEditingController();

  void _criarConta() {
    if (_formKey.currentState!.validate()) {
      if (_senhaController.text == _confirmarSenhaController.text) {
        ShowDialogConfirm.show(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('As senhas não correspondem.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  String? _validarSenha(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe a senha';
    }
    if (value.length < 8) {
      return 'A senha deve ter pelo menos 8 caracteres';
    }
    final regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    if (!regex.hasMatch(value)) {
      return 'A senha deve conter pelo menos uma letra e um número';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff114E83),
      body: Center(
        child: SizedBox(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      icon: const Icon(Icons.arrow_back),
                      iconSize: 55,
                      tooltip: 'voltar',
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    SizedBox(
                      width: 250,
                      height: 180,
                      child: Image.asset('assets/LogoFood.png'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: SizedBox(
                    width: 250,
                    child: TextFormField(
                      controller: _nomeController,
                      cursorColor: Colors.black,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      maxLength: 40,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, informe o nome';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        counterText: '',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'nome',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: 250,
                    child: TextFormField(
                      controller: _emailController,
                      cursorColor: Colors.black,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      validator: EmailValidator.validate,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'E-mail',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: 250,
                    child: TextFormField(
                      obscureText: true,
                      controller: _senhaController,
                      cursorColor: Colors.black,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      validator: _validarSenha,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Defina sua senha',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: 250,
                    child: TextFormField(
                      obscureText: true,
                      controller: _confirmarSenhaController,
                      cursorColor: Colors.black,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, informe a senha';
                        }
                        if (value != _senhaController.text) {
                          return 'As senhas não correspondem';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Confirme sua senha',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: 250,
                    child: TextFormField(
                      controller: _telefoneController,
                      cursorColor: Colors.black,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, informe o Telefone';
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        PhoneNumberFormatter(),
                      ],
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Telefone',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: 250,
                    child: TextFormField(
                      controller: _dataNascimentoController,
                      cursorColor: Colors.black,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      maxLength: 10,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, informe a data de nascimento';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (value.length > 10) {
                          return;
                        }

                        if (value.length == 2 || value.length == 5) {
                          _dataNascimentoController.text = '$value/';
                          _dataNascimentoController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset:
                                      _dataNascimentoController.text.length));
                        }
                      },
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        counterText: '',
                        border: OutlineInputBorder(),
                        labelText: 'Data de nascimento',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 250,
                  color: Colors.white,
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all<Color>(
                          const Color.fromARGB(255, 5, 5, 5)),
                    ),
                    onPressed: () {
                      _criarConta();
                    },
                    child: const Text(
                      'Criar Conta',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
