import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegistrarPage extends StatefulWidget {
  const RegistrarPage({super.key});

  @override
  State<RegistrarPage> createState() => _RegistrarPageState();
}

class _RegistrarPageState extends State<RegistrarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff114E83),
      body: Center(
        child: SizedBox(
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
                child: Container(
                  color: Colors.white,
                  child: const SizedBox(
                    width: 250,
                    height: 35,
                    child: TextField(
                      cursorColor: Colors.black,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'nome',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  child: const SizedBox(
                    width: 250,
                    height: 35,
                    child: TextField(
                      cursorColor: Colors.black,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'E-mail',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  child: const SizedBox(
                    width: 250,
                    height: 35,
                    child: TextField(
                      cursorColor: Colors.black,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Defina sua senha',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  child: const SizedBox(
                    width: 250,
                    height: 35,
                    child: TextField(
                      cursorColor: Colors.black,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirme sua senha',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  child: const SizedBox(
                    width: 250,
                    height: 35,
                    child: TextField(
                      cursorColor: Colors.black,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Telefone',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  child: const SizedBox(
                    width: 250,
                    height: 35,
                    child: TextField(
                      cursorColor: Colors.black,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Data de nascimento',
                      ),
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
                  onPressed: () {},
                  child: const Text(
                    'Criar Conta',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
